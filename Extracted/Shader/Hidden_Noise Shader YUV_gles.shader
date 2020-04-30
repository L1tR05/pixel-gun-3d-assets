//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Noise Shader YUV" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_GrainTex ("Base (RGB)", 2D) = "gray" { }
_ScratchTex ("Base (RGB)", 2D) = "gray" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 56988
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
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
uniform 	mediump vec4 _Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _GrainTex;
uniform lowp sampler2D _ScratchTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat10_0.xyz = texture2D(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat10_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat10_0.xyz = texture2D(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
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
uniform 	mediump vec4 _Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _GrainTex;
uniform lowp sampler2D _ScratchTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat10_0.xyz = texture2D(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat10_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat10_0.xyz = texture2D(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GrainOffsetScale;
uniform 	vec4 _ScratchOffsetScale;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _GrainOffsetScale.zw + _GrainOffsetScale.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _ScratchOffsetScale.zw + _ScratchOffsetScale.xy;
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
uniform 	mediump vec4 _Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _GrainTex;
uniform lowp sampler2D _ScratchTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat10_0.xyz = texture2D(_GrainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.x = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xy = u_xlat10_1.zx + (-u_xlat16_2.xx);
    SV_Target0.w = u_xlat10_1.w;
    u_xlat16_2.yz = u_xlat16_3.xy * vec2(0.492000014, 0.876999974);
    u_xlat16_2.xyz = u_xlat16_0.xyz * _Intensity.xxx + u_xlat16_2.xyz;
    u_xlat16_14 = dot(u_xlat16_2.zy, vec2(-0.58099997, -0.395000011));
    u_xlat16_3.y = u_xlat16_2.x + u_xlat16_14;
    u_xlat16_3.xz = u_xlat16_2.zy * vec2(1.13999999, 2.03200006) + u_xlat16_2.xx;
    u_xlat10_0.xyz = texture2D(_ScratchTex, vs_TEXCOORD2.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    SV_Target0.xyz = u_xlat16_0.xyz * _Intensity.yyy + u_xlat16_3.xyz;
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
}
}
}
}