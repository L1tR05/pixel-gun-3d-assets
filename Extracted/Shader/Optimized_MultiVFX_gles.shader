//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Optimized/MultiVFX" {
Properties {
_GridSize ("Grid size (XY for main, ZW for mask)", Vector) = (1,1,1,1)
_SectorSize ("Tile size (XY for main, ZW for mask)", Vector) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
_Color ("Color", Color) = (1,1,1,1)
_Multiplier ("Multiplier", Float) = 1
[Toggle(FADE_FEATURE)] _FadeFeature ("Enable fading", Float) = 0
_Offset ("Offset", Range(-0.5, 1)) = 0
_Smoothness ("Smoothness", Range(0, 0.5)) = 0.1
[Header(XXXXXXX)] [Toggle(SCROLL_FEATURE)] _ScrollFeature ("Enable scrolling", Float) = 0
_SpeedX ("SpeedX", Float) = 0.3
_SpeedY ("SpeedY", Float) = 1
[Space(20)] _Mask ("Mask", 2D) = "white" { }
[Toggle(MASK_SCROLL_FEATURE)] _MaskScrollFeature ("Enable mask scrolling", Float) = 0
_MaskSpeedX ("SpeedX", Float) = 0.3
_MaskSpeedY ("SpeedY", Float) = 1
[Header(Fresnel)] [Toggle(FRESNEL_FEATURE)] _FresnelFeature ("Enable fresnel", Float) = 0
[Toggle(FRESNEL_INVERT_FEATURE)] _FresnelInvertFeature ("Invert fresnel", Float) = 0
_Fresnel ("Fresnel", Range(0, 90)) = 20
_FresnelSmooth ("Fresnel smoothness", Range(0, 90)) = 10
[Header(Material Properties)] [Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull Mode", Float) = 0
_Blending ("Blending", Float) = 1
_SrcBlend ("SrcBlend", Float) = 1
_DstBlend ("DstBlend", Float) = 1
[Toggle(USE_CUSTOM_DATA)] _UseCustomData1 ("Use custom data", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent+6" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent+6" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 15625
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _MaskSpeedX;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_MaskSpeedX, _MaskSpeedY);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _MaskSpeedX;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_MaskSpeedX, _MaskSpeedY);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _MaskSpeedX;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_MaskSpeedX, _MaskSpeedY);
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec2 u_xlat6;
void main()
{
    u_xlat0 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat0.zw);
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD1.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0 = u_xlat10_0 * u_xlat1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-in_POSITION0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_NORMAL0 = dot(in_NORMAL0.xyz, u_xlat0.xyz);
    vs_NORMAL0 = clamp(vs_NORMAL0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform 	float _Fresnel;
uniform 	float _FresnelSmooth;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _FresnelSmooth * 0.0111111002;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat3.x = _Fresnel * 0.0111111002 + u_xlat0.x;
    u_xlat0.x = _Fresnel * 0.0111111002 + (-u_xlat0.x);
    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
    u_xlat0.x = (-u_xlat0.x) + vs_NORMAL0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat1 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat1.zw);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * vs_TEXCOORD1.xy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_2 = u_xlat10_2 * _Color;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat2.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0 = u_xlat2 * vs_COLOR0;
    u_xlat0 = u_xlat10_1 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-in_POSITION0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_NORMAL0 = dot(in_NORMAL0.xyz, u_xlat0.xyz);
    vs_NORMAL0 = clamp(vs_NORMAL0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform 	float _Fresnel;
uniform 	float _FresnelSmooth;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _FresnelSmooth * 0.0111111002;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat3.x = _Fresnel * 0.0111111002 + u_xlat0.x;
    u_xlat0.x = _Fresnel * 0.0111111002 + (-u_xlat0.x);
    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
    u_xlat0.x = (-u_xlat0.x) + vs_NORMAL0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat1 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat1.zw);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * vs_TEXCOORD1.xy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_2 = u_xlat10_2 * _Color;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat2.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0 = u_xlat2 * vs_COLOR0;
    u_xlat0 = u_xlat10_1 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat0.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-in_POSITION0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_NORMAL0 = dot(in_NORMAL0.xyz, u_xlat0.xyz);
    vs_NORMAL0 = clamp(vs_NORMAL0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _MaskSpeedX;
uniform 	float _SpeedY;
uniform 	float _MaskSpeedY;
uniform 	float _Multiplier;
uniform 	float _Fresnel;
uniform 	float _FresnelSmooth;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp float vs_NORMAL0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = _FresnelSmooth * 0.0111111002;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat3.x = _Fresnel * 0.0111111002 + u_xlat0.x;
    u_xlat0.x = _Fresnel * 0.0111111002 + (-u_xlat0.x);
    u_xlat3.x = (-u_xlat0.x) + u_xlat3.x;
    u_xlat0.x = (-u_xlat0.x) + vs_NORMAL0;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat3.x) * u_xlat0.x + 1.0;
    u_xlat1 = _Time.yyyy * vec4(_SpeedX, _SpeedY, _MaskSpeedX, _MaskSpeedY);
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + (-u_xlat1.zw);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * vs_TEXCOORD1.xy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_2 = u_xlat10_2 * _Color;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat2.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0 = u_xlat2 * vs_COLOR0;
    u_xlat0 = u_xlat10_1 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Offset;
uniform 	float _Multiplier;
uniform 	float _Smoothness;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + _Offset;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + _Smoothness;
    u_xlat0.x = u_xlat0.x + (-_Smoothness);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Offset;
uniform 	float _Multiplier;
uniform 	float _Smoothness;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + _Offset;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + _Smoothness;
    u_xlat0.x = u_xlat0.x + (-_Smoothness);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Offset;
uniform 	float _Multiplier;
uniform 	float _Smoothness;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + _Offset;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + _Smoothness;
    u_xlat0.x = u_xlat0.x + (-_Smoothness);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = _Time.yy * vec2(_SpeedX, _SpeedY);
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.zw;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD2.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + vs_TEXCOORD2.w;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = vec2(_SpeedX, _SpeedY) * _Time.yy + vs_TEXCOORD2.xy;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.zw;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD2.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + vs_TEXCOORD2.w;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = vec2(_SpeedX, _SpeedY) * _Time.yy + vs_TEXCOORD2.xy;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _GridSize;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = max(_GridSize, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
    vs_TEXCOORD1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    vs_TEXCOORD2.xy = in_TEXCOORD0.zw;
    vs_TEXCOORD2.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _SectorSize;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _Color;
uniform 	float _SpeedX;
uniform 	float _SpeedY;
uniform 	float _Multiplier;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y + vs_TEXCOORD2.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x + vs_TEXCOORD2.w;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlat3 = (-u_xlat0.x) + u_xlat3;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat6.xy = vec2(_SpeedX, _SpeedY) * _Time.yy + vs_TEXCOORD2.xy;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + (-u_xlat6.xy);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * _SectorSize.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy * vs_TEXCOORD1.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat2 = (-u_xlat0.xxxx) + u_xlat10_1;
    u_xlat16_1 = u_xlat10_1 * _Color;
    u_xlat0 = vec4(u_xlat3) * u_xlat2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat2 = u_xlat0 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(vec3(_Multiplier, _Multiplier, _Multiplier));
    u_xlat1.w = u_xlat0.w * u_xlat16_1.w;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 * vs_COLOR0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy * _SectorSize.zw + _Mask_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vs_TEXCOORD1.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat2.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
Keywords { "SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FRESNEL_FEATURE" "FRESNEL_INVERT_FEATURE" "SCROLL_FEATURE" "MASK_SCROLL_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "USE_CUSTOM_DATA" "SCROLL_FEATURE" "FADE_FEATURE" }
""
}
}
}
}
CustomEditor "MultiVFXGUI"
}