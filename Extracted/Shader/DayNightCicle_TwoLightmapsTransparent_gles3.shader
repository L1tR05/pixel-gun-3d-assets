//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "DayNightCicle/TwoLightmapsTransparent" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_LightMap ("Base (RGB) Gloss (A)", 2D) = "white" { }
_LightMapNight ("Base (RGB) Gloss (A)", 2D) = "white" { }
_Lerp ("Shininess", Range(0, 1)) = 0
_Color ("Color", Color) = (1,1,1,1)
_Brightness ("Brightness", Range(0, 4)) = 0
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  GpuProgramID 61231
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
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
uniform 	vec4 unity_LightmapST;
uniform 	mediump vec4 _LightColor0;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    u_xlat16_2.x = u_xlat4 * _LightColor0.w;
    vs_COLOR0.w = u_xlat16_2.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	float _Brightness;
uniform 	float _Lerp;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _LightMap;
uniform mediump sampler2D _LightMapNight;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.w<0.5);
#else
    u_xlatb1 = u_xlat0.w<0.5;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_1.xyz = texture(_LightMapNight, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat1.xyz = vec3(vec3(_Lerp, _Lerp, _Lerp)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Brightness);
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
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
uniform 	vec4 unity_LightmapST;
uniform 	mediump vec4 _LightColor0;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    u_xlat16_2.x = u_xlat4 * _LightColor0.w;
    vs_COLOR0.w = u_xlat16_2.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	float _Brightness;
uniform 	float _Lerp;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _LightMap;
uniform mediump sampler2D _LightMapNight;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.w<0.5);
#else
    u_xlatb1 = u_xlat0.w<0.5;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_1.xyz = texture(_LightMapNight, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat1.xyz = vec3(vec3(_Lerp, _Lerp, _Lerp)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Brightness);
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _WorldSpaceLightPos0;
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
uniform 	vec4 unity_LightmapST;
uniform 	mediump vec4 _LightColor0;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
float u_xlat15;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0 = vec4(u_xlat15) * u_xlat0.xyzz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzwx * u_xlat0.xywz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat4 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4 = max(u_xlat4, 0.0);
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_COLOR0.xyz = vec3(u_xlat4) * _LightColor0.xyz + u_xlat0.xyz;
    u_xlat16_2.x = u_xlat4 * _LightColor0.w;
    vs_COLOR0.w = u_xlat16_2.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_Lightmap_HDR;
uniform 	float _Brightness;
uniform 	float _Lerp;
uniform 	mediump vec4 _Color;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _LightMap;
uniform mediump sampler2D _LightMapNight;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 * _Color;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.w<0.5);
#else
    u_xlatb1 = u_xlat0.w<0.5;
#endif
    if(((int(u_xlatb1) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_1.xyz = texture(_LightMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_1.xyz = texture(_LightMapNight, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = unity_Lightmap_HDR.xxx * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat1.xyz = vec3(vec3(_Lerp, _Lerp, _Lerp)) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Brightness);
    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
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