//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TestBed/Dissolve/Dissolve Diffuse" {
Properties {
_Burn ("Burn Amount", Range(-0.25, 1.25)) = 0
_LineWidth ("Burn Line Size", Range(0, 0.2)) = 0.1
_BurnColor ("Burn Color", Color) = (1,0,0,1)
_MainTex ("Main Texture", 2D) = "white" { }
_BurnMap ("Burn Map", 2D) = "white" { }
}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 27450
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
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _BurnMap_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.zw = in_TEXCOORD0.xy * _BurnMap_ST.xy + _BurnMap_ST.zw;
    vs_TEXCOORD0 = u_xlat0;
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
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Burn;
uniform 	float _LineWidth;
uniform 	mediump vec4 _BurnColor;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _BurnMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _LineWidth + _Burn;
    u_xlat16_4 = texture(_BurnMap, vs_TEXCOORD0.zw).x;
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_4;
    u_xlat0.y = u_xlat16_4 + (-_Burn);
    u_xlat0.xy = u_xlat0.xy + vec2(0.99000001, 0.99000001);
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat1.w = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.xzw = u_xlat0.xxx * (-_BurnColor.xyz) + _BurnColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w<0.0);
#else
    u_xlatb2 = u_xlat1.w<0.0;
#endif
    if(((int(u_xlatb2) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat16_2.xyz);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.yyy;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz + u_xlat0.xzw;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _BurnMap_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.zw = in_TEXCOORD0.xy * _BurnMap_ST.xy + _BurnMap_ST.zw;
    vs_TEXCOORD0 = u_xlat0;
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
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Burn;
uniform 	float _LineWidth;
uniform 	mediump vec4 _BurnColor;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _BurnMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _LineWidth + _Burn;
    u_xlat16_4 = texture(_BurnMap, vs_TEXCOORD0.zw).x;
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_4;
    u_xlat0.y = u_xlat16_4 + (-_Burn);
    u_xlat0.xy = u_xlat0.xy + vec2(0.99000001, 0.99000001);
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat1.w = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.xzw = u_xlat0.xxx * (-_BurnColor.xyz) + _BurnColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w<0.0);
#else
    u_xlatb2 = u_xlat1.w<0.0;
#endif
    if(((int(u_xlatb2) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat16_2.xyz);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.yyy;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz + u_xlat0.xzw;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _BurnMap_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.zw = in_TEXCOORD0.xy * _BurnMap_ST.xy + _BurnMap_ST.zw;
    vs_TEXCOORD0 = u_xlat0;
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
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Burn;
uniform 	float _LineWidth;
uniform 	mediump vec4 _BurnColor;
uniform mediump sampler2D _MainTex;
uniform mediump sampler2D _BurnMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _LineWidth + _Burn;
    u_xlat16_4 = texture(_BurnMap, vs_TEXCOORD0.zw).x;
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_4;
    u_xlat0.y = u_xlat16_4 + (-_Burn);
    u_xlat0.xy = u_xlat0.xy + vec2(0.99000001, 0.99000001);
    u_xlat0.xy = trunc(u_xlat0.xy);
    u_xlat1.w = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.xzw = u_xlat0.xxx * (-_BurnColor.xyz) + _BurnColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w<0.0);
#else
    u_xlatb2 = u_xlat1.w<0.0;
#endif
    if(((int(u_xlatb2) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat0.xzw + (-u_xlat16_2.xyz);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.yyy;
    u_xlat2.xyz = u_xlat0.yyy * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz + u_xlat0.xzw;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    SV_Target0 = min(max(SV_Target0, 0.0), 1.0);
#else
    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
#endif
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
Fallback "VertexLit"
}