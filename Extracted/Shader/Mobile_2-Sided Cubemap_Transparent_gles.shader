//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/2-Sided Cubemap_Transparent" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Cube ("Cubemap", Cube) = "" { }
}
SubShader {
 LOD 150
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Tranparent" }
 Pass {
  Name "FORWARD"
  LOD 150
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Tranparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 22328
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 0.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_2.w;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_1) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 0.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_2.w;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_1) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1 = max(u_xlat16_1, 0.0);
    u_xlat10_2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_2.w;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(u_xlat16_1) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_3.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_3.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_3.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    SV_Target0.w = u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_1.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat2.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat2.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat2 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat2.xyz * _LightColor0.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat16 = u_xlat16 + u_xlat16;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_3.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_3.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_4.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_15;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_15 = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_15 = max(u_xlat16_15, 0.0);
    u_xlat16_2.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + u_xlat16_0.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat16_1.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + (-unity_FogColor.xyz);
    u_xlat9 = vs_TEXCOORD3.w;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-u_xlat1.xyz);
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform mediump sampler2D unity_Lightmap;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat18;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.y * vs_TEXCOORD2.y;
    u_xlat16_0.x = vs_TEXCOORD2.x * vs_TEXCOORD2.x + (-u_xlat16_0.x);
    u_xlat16_1 = vs_TEXCOORD2.yzzx * vs_TEXCOORD2.xyzz;
    u_xlat16_2.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_2.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_2.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_0.xyz = unity_SHC.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_2.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_2.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_2.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = texture2D(unity_Lightmap, vs_TEXCOORD4.xy).xyz;
    u_xlat16_0.xyz = unity_Lightmap_HDR.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat1.xyz * u_xlat16_0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat18 = vs_TEXCOORD3.w;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD3.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat2.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cube;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_0.x = max(u_xlat16_0.x, 0.0);
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat10_3.xyz = textureCube(_Cube, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3.w;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
}
Fallback "Mobile/VertexLit"
}