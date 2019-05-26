//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Glow 11/BlurEffectConeTap" {
Properties {
_MainTex ("", any) = "" { }
_Strength ("Strength", Float) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 60443
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BlurOffsets;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
mediump vec2 u_xlat16_8;
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
    u_xlat16_2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + u_xlat16_2.xy;
    u_xlat16_8.xy = _MainTex_TexelSize.xy * _BlurOffsets.xy;
    vs_TEXCOORD3.xy = u_xlat16_8.xy * vec2(1.0, -1.0) + u_xlat16_2.xy;
    vs_TEXCOORD4.xy = (-u_xlat16_8.xy) * vec2(1.0, -1.0) + u_xlat16_2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _Strength;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vec4(_Strength);
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BlurOffsets;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
mediump vec2 u_xlat16_8;
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
    u_xlat16_2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + u_xlat16_2.xy;
    u_xlat16_8.xy = _MainTex_TexelSize.xy * _BlurOffsets.xy;
    vs_TEXCOORD3.xy = u_xlat16_8.xy * vec2(1.0, -1.0) + u_xlat16_2.xy;
    vs_TEXCOORD4.xy = (-u_xlat16_8.xy) * vec2(1.0, -1.0) + u_xlat16_2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _Strength;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vec4(_Strength);
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _BlurOffsets;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
mediump vec2 u_xlat16_8;
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
    u_xlat16_2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = (-_BlurOffsets.xy) * _MainTex_TexelSize.xy + u_xlat16_2.xy;
    u_xlat16_8.xy = _MainTex_TexelSize.xy * _BlurOffsets.xy;
    vs_TEXCOORD3.xy = u_xlat16_8.xy * vec2(1.0, -1.0) + u_xlat16_2.xy;
    vs_TEXCOORD4.xy = (-u_xlat16_8.xy) * vec2(1.0, -1.0) + u_xlat16_2.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _Strength;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vec4(_Strength);
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