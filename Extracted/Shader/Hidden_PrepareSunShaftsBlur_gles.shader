//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PrepareSunShaftsBlur" {
Properties {
_MainTex ("Base", 2D) = "" { }
_Skybox ("Skybox", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 50821
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_0 = u_xlat16_0 * _NoSkyBoxMask;
    u_xlat16_0 = max(u_xlat16_0, u_xlat10_0.w);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_0;
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlatb0 = 0.99000001<u_xlat0.x;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_0 = u_xlat16_0 * _NoSkyBoxMask;
    u_xlat16_0 = max(u_xlat16_0, u_xlat10_0.w);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_0;
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlatb0 = 0.99000001<u_xlat0.x;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_0 = u_xlat16_0 * _NoSkyBoxMask;
    u_xlat16_0 = max(u_xlat16_0, u_xlat10_0.w);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_0;
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlatb0 = 0.99000001<u_xlat0.x;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 113549
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform lowp sampler2D _Skybox;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_4;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_Skybox, vs_TEXCOORD0.xy);
    u_xlat16_2 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_2 = u_xlat16_2 * _NoSkyBoxMask;
    u_xlat16_9 = max(u_xlat10_0.w, u_xlat16_2);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_9;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4 = dot(abs(u_xlat16_0.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat16_4<0.200000003;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform lowp sampler2D _Skybox;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_4;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_Skybox, vs_TEXCOORD0.xy);
    u_xlat16_2 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_2 = u_xlat16_2 * _NoSkyBoxMask;
    u_xlat16_9 = max(u_xlat10_0.w, u_xlat16_2);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_9;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4 = dot(abs(u_xlat16_0.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat16_4<0.200000003;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	mediump float _NoSkyBoxMask;
uniform 	mediump vec4 _SunPosition;
uniform lowp sampler2D _Skybox;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_4;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD0.xy) + _SunPosition.xy;
    u_xlat16_1 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_1 = sqrt(u_xlat16_1);
    u_xlat16_1 = (-u_xlat16_1) + _SunPosition.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat10_0 = texture2D(_Skybox, vs_TEXCOORD0.xy);
    u_xlat16_2 = dot(u_xlat10_0.xyz, vec3(0.589999974, 0.300000012, 0.109999999));
    u_xlat16_2 = u_xlat16_2 * _NoSkyBoxMask;
    u_xlat16_9 = max(u_xlat10_0.w, u_xlat16_2);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_9;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4 = dot(abs(u_xlat16_0.xyz), vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat16_4<0.200000003;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(u_xlat16_1) : vec4(0.0, 0.0, 0.0, 0.0);
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