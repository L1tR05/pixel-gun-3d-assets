//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/Splatmap-LightmapOnly" {
Properties {
_Control ("Texture", 2D) = "white" { }
_LM ("Lightmap", 2D) = "white" { }
_Splat3 ("Layer 3 (A)", 2D) = "white" { }
_Splat2 ("Layer 2 (B)", 2D) = "white" { }
_Splat1 ("Layer 1 (G)", 2D) = "white" { }
_Splat0 ("Layer 0 (R)", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-100" "RenderType" = "Opaque" }
  GpuProgramID 14709
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 _Splat0_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD3 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy * _Splat0_ST.xy + _Splat0_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	mediump vec4 unity_FogColor;
uniform mediump sampler2D _Control;
uniform mediump sampler2D _Splat3;
uniform mediump sampler2D _Splat0;
uniform mediump sampler2D _Splat1;
uniform mediump sampler2D _Splat2;
uniform mediump sampler2D _LM;
in highp vec2 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_Splat0, vs_TEXCOORD2.xy).xyz;
    u_xlat16_1.xyz = texture(_Splat3, vs_TEXCOORD2.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat16_7 = (-u_xlat16_2) + 1.0;
    u_xlat16_3 = texture(_Control, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat16_3.y * u_xlat16_7 + u_xlat16_2;
    u_xlat16_4.xyz = texture(_Splat1, vs_TEXCOORD2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_2) * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xxx * u_xlat16_0.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_Splat2, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.zzz * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_1.xyz + u_xlat16_0.xyz;
    u_xlat1 = texture(_LM, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
    u_xlat15 = vs_TEXCOORD3;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
}
}
}
}