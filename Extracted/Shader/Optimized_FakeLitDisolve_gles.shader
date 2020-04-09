//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/FakeLitDisolve" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_DisolveTex ("Disolve Texture", 2D) = "white" { }
_DisolveColor ("Color", Color) = (1,1,1,1)
_Disolve ("Disolve", Range(0, 1)) = 1
_CutOut ("Cutout", Range(0, 1)) = 1
_SunX ("SunX", Range(-1, 1)) = 1
_SunY ("SunY", Range(-1, 1)) = 1
_SunZ ("SunZ", Range(-1, 1)) = 1
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent-100" "RenderType" = "Transparent" }
  ZTest Less
  GpuProgramID 64194
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _SunX;
uniform 	mediump float _SunY;
uniform 	mediump float _SunZ;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(_SunX, _SunY, _SunZ));
    u_xlat16_2.xy = max(u_xlat16_2.xx, vec2(0.5, 0.5));
    vs_COLOR1.z = u_xlat16_2.y * 1.29999995;
    vs_COLOR1.xy = u_xlat16_2.xy;
    vs_COLOR1.w = 1.0;
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
uniform 	mediump float _CutOut;
uniform 	mediump float _Disolve;
uniform 	mediump vec4 _DisolveColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DisolveTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
bvec3 u_xlatb5;
mediump float u_xlat16_6;
void main()
{
    u_xlat10_0 = texture2D(_DisolveTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = u_xlat10_0 + -1.0;
    u_xlat16_6 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = _Disolve * u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = u_xlat16_1.x + _CutOut;
    u_xlatb0 = u_xlat16_1.x<0.949999988;
    u_xlat16_1.w = u_xlat16_6 + -0.100000001;
    u_xlat16_2.x = max(u_xlat16_1.w, 0.00999999978);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + (-_CutOut);
    u_xlatb5.x = u_xlat16_2.x<0.0;
    u_xlatb5.x = u_xlatb0 && u_xlatb5.x;
    if(((int(u_xlatb5.x) * -1))!=0){discard;}
    u_xlat16_2.xyz = vec3(vec3(_CutOut, _CutOut, _CutOut)) + vec3(0.300000012, 0.0199999996, 0.00999999978);
    u_xlatb5.xyz = lessThan(u_xlat16_1.wwww, u_xlat16_2.xyzz).xyz;
    u_xlat16_2.xyz = _DisolveColor.xyz * vec3(0.333333343, 0.333333343, 0.333333343);
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_3 * vs_COLOR1;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.x) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_2.xyz = (u_xlatb5.y) ? _DisolveColor.xyz : u_xlat16_2.xyz;
    u_xlat16_4.xyz = _DisolveColor.xyz + _DisolveColor.xyz;
    u_xlat16_1.xyz = (u_xlatb5.z) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat16_1 : u_xlat16_3;
    return;
}

#endif
"
}
}
Program "fp" {
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
}
}
}
}