//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-ScreenSpaceShadows" {
Properties {
_ShadowMapTexture ("", any) = "" { }
_ODSWorldTexture ("", 2D) = "" { }
}
SubShader {
 Tags { "ShadowmapFilter" = "HardShadow" }
 Pass {
  Tags { "ShadowmapFilter" = "HardShadow" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 62865
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
float u_xlat10;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
float u_xlat10;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
float u_xlat10;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat3 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6 = (-u_xlat3) + u_xlat0.x;
    u_xlat3 = unity_OrthoParams.w * u_xlat6 + u_xlat3;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat3) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
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
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
SubShader {
 Tags { "ShadowmapFilter" = "HardShadow_FORCE_INV_PROJECTION_IN_PS" }
 Pass {
  Tags { "ShadowmapFilter" = "HardShadow_FORCE_INV_PROJECTION_IN_PS" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 106743
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_4 = (-_LightShadowData.x) + 1.0;
    u_xlat16_4 = (u_xlatb0) ? 0.0 : u_xlat16_4;
    SV_Target0 = vec4(u_xlat16_4) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_3.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat16_3.x;
    SV_Target0 = u_xlat16_3.xxxx + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat16_2 = (-_LightShadowData.x) + 1.0;
    u_xlat16_2 = (u_xlatb0) ? 0.0 : u_xlat16_2;
    SV_Target0 = vec4(u_xlat16_2) + _LightShadowData.xxxx;
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
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
SubShader {
 Tags { "ShadowmapFilter" = "PCF_SOFT" }
 Pass {
  Tags { "ShadowmapFilter" = "PCF_SOFT" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 180047
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
vec2 u_xlat7;
float u_xlat10;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
vec2 u_xlat7;
float u_xlat10;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
float u_xlat5;
vec2 u_xlat7;
float u_xlat10;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat10 = (-u_xlat5) + u_xlat0.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat10 + u_xlat5;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlatb1 = greaterThanEqual(u_xlat0.zzzz, _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan(u_xlat0.zzzz, _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat4;
vec3 u_xlat5;
float u_xlat8;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat4 = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat8 = (-u_xlat4) + u_xlat0.x;
    u_xlat4 = unity_OrthoParams.w * u_xlat8 + u_xlat4;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat1.xyz + vs_TEXCOORD2.xyz;
    u_xlat0.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat4) + u_xlat0.xzw;
    u_xlat1.xyz = vec3(u_xlat4) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = unity_OrthoParams.www * u_xlat0.xzw + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
float u_xlat9;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.x = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat5 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat5 = float(1.0) / u_xlat5;
    u_xlat9 = (-u_xlat5) + u_xlat1.x;
    u_xlat5 = unity_OrthoParams.w * u_xlat9 + u_xlat5;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + vs_TEXCOORD3.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat2.xyz + vs_TEXCOORD2.xyz;
    u_xlat1.xzw = (-vs_TEXCOORD1.xyz) * vec3(u_xlat5) + u_xlat1.xzw;
    u_xlat2.xyz = vec3(u_xlat5) * vs_TEXCOORD1.xyz;
    u_xlat1.xyz = unity_OrthoParams.www * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
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
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
SubShader {
 Tags { "ShadowmapFilter" = "PCF_SOFT_FORCE_INV_PROJECTION_IN_PS" }
 Pass {
  Tags { "ShadowmapFilter" = "PCF_SOFT_FORCE_INV_PROJECTION_IN_PS" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 202046
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat7;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat7;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightSplitsNear;
uniform 	vec4 _LightSplitsFar;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec2 u_xlat7;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlatb1 = greaterThanEqual((-u_xlat0.zzzz), _LightSplitsNear);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlatb2 = lessThan((-u_xlat0.zzzz), _LightSplitsFar);
    u_xlat2 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb2));
    u_xlat16_1 = u_xlat1 * u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_1.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.www + u_xlat2.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat2 = u_xlat0.xyxy + u_xlat1.zwxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.zw).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat2.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat2.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb2.x = u_xlat2.x<u_xlat0.z;
    u_xlat2.x = (u_xlatb2.x) ? 0.0 : 1.0;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat1.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat7.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat11.x = _ShadowMapTexture_TexelSize.x;
    u_xlat7.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat7.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat16_4 = u_xlat2.x + u_xlat16_4;
    u_xlat2.x = 0.0;
    u_xlat2.y = _ShadowMapTexture_TexelSize.y;
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat15 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb15 = u_xlat15<u_xlat0.z;
    u_xlat15 = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat15 + u_xlat16_4;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_4) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_ShadowSplitSpheres[4];
uniform 	vec4 unity_ShadowSplitSqRadii;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.xy = vs_TEXCOORD0.zw;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat0.zzzz) + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[0].xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[1].xyz);
    u_xlat1.y = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[2].xyz);
    u_xlat1.z = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.xyz = u_xlat0.xyz + (-unity_ShadowSplitSpheres[3].xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = lessThan(u_xlat1, unity_ShadowSplitSqRadii);
    u_xlat16_3.x = (u_xlatb1.x) ? float(-1.0) : float(-0.0);
    u_xlat16_3.y = (u_xlatb1.y) ? float(-1.0) : float(-0.0);
    u_xlat16_3.z = (u_xlatb1.z) ? float(-1.0) : float(-0.0);
    u_xlat1 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb1));
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat1.yzw;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat5.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[5].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[4].xyz * u_xlat0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[6].xyz * u_xlat0.zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToShadow[7].xyz * u_xlat0.www + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xxx + u_xlat5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[9].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[8].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[10].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[11].xyz * u_xlat0.www + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat16_3.yyy + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToShadow[13].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[12].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[14].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToShadow[15].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat1.z = 0.0;
    u_xlat1.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat1 = u_xlat0.xyxy + u_xlat1;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat1.x;
    u_xlat1 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat1.x = texture2D(_ShadowMapTexture, u_xlat1.zw).x;
    u_xlatb1.x = u_xlat1.x<u_xlat0.z;
    u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat5.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat5.xy = u_xlat0.xy + u_xlat10.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat5.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_3.x;
    u_xlat1.x = 0.0;
    u_xlat1.y = _ShadowMapTexture_TexelSize.y;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat12 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb12 = u_xlat12<u_xlat0.z;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat12 + u_xlat16_3.x;
    u_xlat0.xy = u_xlat0.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x<u_xlat0.z;
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat16_3.x = u_xlat0.x + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = u_xlat16_3.xxxx * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
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
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD0.zw = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = in_TEXCOORD1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-hlslcc_mtx4x4unity_CameraInvProjection[2].xyz);
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[2].xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_CameraInvProjection[3].xyz;
    u_xlat1.w = (-u_xlat1.z);
    vs_TEXCOORD2.xyz = u_xlat1.xyw;
    u_xlat0.w = (-u_xlat0.z);
    vs_TEXCOORD3.xyz = u_xlat0.xyw;
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
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat10;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.z = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw;
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[2] * (-u_xlat1.zzzz) + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToShadow[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToShadow[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToShadow[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat0.xyw = (-_ShadowMapTexture_TexelSize.xyy);
    u_xlat0 = u_xlat0 + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat4 = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb4 = u_xlat4<u_xlat1.z;
    u_xlat4 = (u_xlatb4) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat4 + u_xlat0.x;
    u_xlat0 = _ShadowMapTexture_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat1.xyxy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlat0.y = texture2D(_ShadowMapTexture, u_xlat0.zw).x;
    u_xlatb0.xy = lessThan(u_xlat0.xyxx, u_xlat1.zzzz).xy;
    u_xlat0.x = (u_xlatb0.x) ? float(0.0) : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? float(0.0) : float(1.0);
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat2.x = (-_ShadowMapTexture_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat0.xz = u_xlat1.xy + u_xlat2.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat10.x = _ShadowMapTexture_TexelSize.x;
    u_xlat0.xz = u_xlat1.xy + u_xlat10.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xz).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat0.y + u_xlat16_3;
    u_xlat0.x = 0.0;
    u_xlat0.y = _ShadowMapTexture_TexelSize.y;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat0.xy = u_xlat1.xy + _ShadowMapTexture_TexelSize.xy;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0.x = u_xlat0.x<u_xlat1.z;
    u_xlat0.x = (u_xlatb0.x) ? 0.0 : 1.0;
    u_xlat16_3 = u_xlat0.x + u_xlat16_3;
    u_xlat16_3 = u_xlat16_3 * 0.111111112;
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat16_0 = vec4(u_xlat16_3) * u_xlat16_0.xxxx + _LightShadowData.xxxx;
    SV_Target0 = u_xlat16_0;
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
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_SPLIT_SPHERES" "SHADOWS_SINGLE_CASCADE" }
""
}
}
}
}
}