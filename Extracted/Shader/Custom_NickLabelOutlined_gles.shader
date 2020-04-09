//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/NickLabelOutlined" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "white" { }
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Cull Off
  Offset -1, -1
  GpuProgramID 48302
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xy = in_POSITION0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
bool u_xlatb2;
mediump float u_xlat16_3;
lowp float u_xlat10_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(0.00300000003, 0.00300000003, -0.00300000003, -0.00300000003);
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_1.xy).w;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat10_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.xw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zy).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat16_2 = u_xlat10_0 + u_xlat16_2;
    u_xlat16_1.x = u_xlat16_2 * vs_COLOR0.w + -0.300000012;
    u_xlat16_1.x = u_xlat16_1.x * 3.33333325;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_3 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_3;
    u_xlatb2 = u_xlat16_1.x<0.5;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_3 = u_xlat10_0 + -0.100000001;
    u_xlat16_3 = u_xlat16_3 * 1.11111116;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    SV_Target0.xyz = vec3(u_xlat16_3) * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat16_1.x;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xy = in_POSITION0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
bool u_xlatb2;
mediump float u_xlat16_3;
lowp float u_xlat10_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(0.00300000003, 0.00300000003, -0.00300000003, -0.00300000003);
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_1.xy).w;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat10_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.xw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zy).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat16_2 = u_xlat10_0 + u_xlat16_2;
    u_xlat16_1.x = u_xlat16_2 * vs_COLOR0.w + -0.300000012;
    u_xlat16_1.x = u_xlat16_1.x * 3.33333325;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_3 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_3;
    u_xlatb2 = u_xlat16_1.x<0.5;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_3 = u_xlat10_0 + -0.100000001;
    u_xlat16_3 = u_xlat16_3 * 1.11111116;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    SV_Target0.xyz = vec3(u_xlat16_3) * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat16_1.x;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xy = in_POSITION0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
lowp float u_xlat10_2;
bool u_xlatb2;
mediump float u_xlat16_3;
lowp float u_xlat10_4;
mediump float u_xlat16_5;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = vs_TEXCOORD0.xyxy + vec4(0.00300000003, 0.00300000003, -0.00300000003, -0.00300000003);
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_1.xy).w;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat10_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.xw).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat10_4 = texture2D(_MainTex, u_xlat16_1.zy).w;
    u_xlat16_2 = u_xlat10_4 + u_xlat16_2;
    u_xlat16_2 = u_xlat10_0 + u_xlat16_2;
    u_xlat16_1.x = u_xlat16_2 * vs_COLOR0.w + -0.300000012;
    u_xlat16_1.x = u_xlat16_1.x * 3.33333325;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_3 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_3;
    u_xlatb2 = u_xlat16_1.x<0.5;
    if(((int(u_xlatb2) * -1))!=0){discard;}
    u_xlat16_3 = u_xlat10_0 + -0.100000001;
    u_xlat16_3 = u_xlat16_3 * 1.11111116;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_3 * -2.0 + 3.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    SV_Target0.xyz = vec3(u_xlat16_3) * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat16_1.x;
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