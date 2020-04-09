//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ColorCorrectionCurves" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
_RgbTex ("_RgbTex (RGB)", 2D) = "" { }
_ZCurve ("_ZCurve (RGB)", 2D) = "" { }
_RgbDepthTex ("_RgbDepthTex (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35762
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _CameraDepthTexture_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Saturation;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _RgbTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ZCurve;
uniform lowp sampler2D _RgbDepthTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat15;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy).xzyw;
    u_xlat1.x = u_xlat0.y;
    u_xlat1.y = float(0.625);
    u_xlat15.y = float(0.5);
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
    SV_Target0.w = u_xlat0.w;
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat10_4.xyz = texture2D(_RgbDepthTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat0.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
    u_xlat10_2.xyz = texture2D(_RgbTex, u_xlat0.zw).xyz;
    u_xlat10_0.xyz = texture2D(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat15.x = float(1.0) / u_xlat0.x;
    u_xlat10_0.x = texture2D(_ZCurve, u_xlat15.xy).x;
    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
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
uniform 	vec4 _CameraDepthTexture_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Saturation;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _RgbTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ZCurve;
uniform lowp sampler2D _RgbDepthTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat15;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy).xzyw;
    u_xlat1.x = u_xlat0.y;
    u_xlat1.y = float(0.625);
    u_xlat15.y = float(0.5);
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
    SV_Target0.w = u_xlat0.w;
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat10_4.xyz = texture2D(_RgbDepthTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat0.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
    u_xlat10_2.xyz = texture2D(_RgbTex, u_xlat0.zw).xyz;
    u_xlat10_0.xyz = texture2D(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat15.x = float(1.0) / u_xlat0.x;
    u_xlat10_0.x = texture2D(_ZCurve, u_xlat15.xy).x;
    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
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
uniform 	vec4 _CameraDepthTexture_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Saturation;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _RgbTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ZCurve;
uniform lowp sampler2D _RgbDepthTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat15;
mediump float u_xlat16_26;
void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy).xzyw;
    u_xlat1.x = u_xlat0.y;
    u_xlat1.y = float(0.625);
    u_xlat15.y = float(0.5);
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat1.xy).xyz;
    u_xlat10_3.xyz = texture2D(_RgbTex, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 0.0, 1.0);
    SV_Target0.w = u_xlat0.w;
    u_xlat0.y = float(0.125);
    u_xlat0.w = float(0.375);
    u_xlat10_4.xyz = texture2D(_RgbDepthTex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat10_2.xyz = texture2D(_RgbDepthTex, u_xlat0.zw).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0) + u_xlat16_5.xyz;
    u_xlat10_2.xyz = texture2D(_RgbTex, u_xlat0.zw).xyz;
    u_xlat10_0.xyz = texture2D(_RgbTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(0.0, 1.0, 0.0);
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat15.x = float(1.0) / u_xlat0.x;
    u_xlat10_0.x = texture2D(_ZCurve, u_xlat15.xy).x;
    u_xlat16_5.xyz = u_xlat10_0.xxx * u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = (-vec3(u_xlat16_26)) + u_xlat16_5.xyz;
    SV_Target0.xyz = vec3(_Saturation) * u_xlat16_5.xyz + vec3(u_xlat16_26);
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