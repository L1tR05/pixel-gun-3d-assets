//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Transparent Effects/CheapForcefield" {
Properties {
_Color ("_Color", Color) = (0,1,0,1)
_Inside ("_Inside", Range(0, 0.2)) = 0
_Rim ("_Rim", Range(1, 2)) = 1.2
_Texture ("_Texture", 2D) = "white" { }
_Tile ("_Tile", Range(1, 10)) = 5
_Strength ("_Strength", Range(0, 5)) = 1.5
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 13380
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2 = vec4(u_xlat18) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.z = u_xlat2.y;
    vs_TEXCOORD3.z = u_xlat2.z;
    u_xlat16_4.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_4.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_4.x);
    u_xlat16_0 = u_xlat2.yzwx * u_xlat2.xywz;
    u_xlat16_5.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_5.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_5.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_4.xyz = unity_SHC.xyz * u_xlat16_4.xxx + u_xlat16_5.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_5.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_5.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_5.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_4.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.x = u_xlat2.z;
    vs_TEXCOORD1.z = u_xlat1.y;
    vs_TEXCOORD2.x = u_xlat2.x;
    vs_TEXCOORD3.x = u_xlat2.y;
    vs_TEXCOORD2.z = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat1.x;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD4.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat21;
float u_xlat22;
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
    vs_TEXCOORD5 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD1.x = u_xlat1.z;
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2 = vec4(u_xlat22) * u_xlat2.xyzz;
    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    vs_TEXCOORD1.y = u_xlat3.x;
    vs_TEXCOORD1.w = u_xlat0.x;
    u_xlat4.xyz = u_xlat2.xyw;
    vs_TEXCOORD1.z = u_xlat4.x;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.y = u_xlat3.y;
    vs_TEXCOORD3.y = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat0.y;
    vs_TEXCOORD2.z = u_xlat4.y;
    vs_TEXCOORD3.w = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat4.z;
    u_xlat16_5.x = u_xlat4.y * u_xlat4.y;
    u_xlat16_5.x = u_xlat4.x * u_xlat4.x + (-u_xlat16_5.x);
    u_xlat16_1 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat4.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat4);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat4);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat4);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat4.yyyy * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat0 * u_xlat2.wwzw + u_xlat4;
    u_xlat1 = u_xlat6 * u_xlat6 + u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat1;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat1 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.y = vs_TEXCOORD2.w;
    u_xlat0.z = vs_TEXCOORD3.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    u_xlat0.x = vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-unity_FogColor.xyz) + _Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 78650
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD6 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD6 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Texture_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD6 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture_ST.xy + _Texture_ST.zw;
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    vs_TEXCOORD1.y = u_xlat2.x;
    vs_TEXCOORD1.x = u_xlat1.z;
    vs_TEXCOORD1.z = u_xlat0.y;
    vs_TEXCOORD2.x = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat1.y;
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD3.z = u_xlat0.x;
    vs_TEXCOORD2.y = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat2.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Inside;
uniform 	mediump float _Rim;
uniform 	mediump float _Tile;
uniform 	mediump float _Strength;
uniform mediump sampler2D _Texture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
float u_xlat9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat0.x + 1.0;
    u_xlat16_2 = log2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(1.0>=u_xlat0.x);
#else
    u_xlatb0 = 1.0>=u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_5 = max(u_xlat16_5, _Inside);
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_2 = u_xlat16_2 * _Rim;
    u_xlat16_2 = exp2(u_xlat16_2);
    u_xlat16_8.xy = vs_TEXCOORD0.xy * vec2(vec2(_Tile, _Tile));
    u_xlat16_0 = texture(_Texture, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat16_0 * _Strength;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_8.x;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    SV_Target0.w = u_xlat16_2 * _Color.w;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
}
}
}
Fallback "Diffuse"
}