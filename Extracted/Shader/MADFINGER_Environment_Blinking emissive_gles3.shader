//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Blinking emissive" {
Properties {
_MainTex ("Base texture", 2D) = "white" { }
_IntensityScaleBias ("Intensity scale X / bias Y", Vector) = (1,0.1,0,0)
_SwitchOnOffDuration ("Switch ON (X) / OFF (Y) duration", Vector) = (1,3,0,0)
_BlinkingRate ("Blinking rate", Float) = 10
_RndGridSize ("Randomization grid size", Float) = 5
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 40833
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 _IntensityScaleBias;
uniform 	vec2 _SwitchOnOffDuration;
uniform 	float _BlinkingRate;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_5;
float u_xlat6;
bool u_xlatb9;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = dot(in_COLOR0, in_COLOR0);
    u_xlat16_5 = u_xlat16_2 * 40.0;
    u_xlat0.x = fract(u_xlat16_5);
    u_xlat0.x = u_xlat0.x * 0.400000006 + 0.800000012;
    u_xlat0.xy = u_xlat0.xx * vec2(_SwitchOnOffDuration.x, _SwitchOnOffDuration.y);
    u_xlat3.x = u_xlat0.y + u_xlat0.x;
    u_xlat6 = u_xlat16_2 * 40.0 + _Time.y;
    u_xlat6 = u_xlat6 / u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb9 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlat3.x = u_xlat3.x * u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat3.x<u_xlat0.x);
#else
    u_xlatb0.x = u_xlat3.x<u_xlat0.x;
#endif
    u_xlat3.x = _Time.y * _BlinkingRate;
    u_xlat3.xy = u_xlat3.xx * vec2(5.0, 3.0);
    u_xlat6 = u_xlat16_2 * 40.0 + u_xlat3.y;
    u_xlat3.y = u_xlat6 + 7.99300003;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat6 = u_xlat3.y * 10.0;
    u_xlat3.x = u_xlat3.x * 17.0 + u_xlat6;
    u_xlat3.x = cos(u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(0.5<abs(u_xlat3.x));
#else
    u_xlatb0.y = 0.5<abs(u_xlat3.x);
#endif
    u_xlat0.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xy));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * in_COLOR0;
    u_xlat0 = u_xlat0 * _IntensityScaleBias.xxxx + _IntensityScaleBias.yyyy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 _IntensityScaleBias;
uniform 	vec2 _SwitchOnOffDuration;
uniform 	float _BlinkingRate;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_5;
float u_xlat6;
bool u_xlatb9;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = dot(in_COLOR0, in_COLOR0);
    u_xlat16_5 = u_xlat16_2 * 40.0;
    u_xlat0.x = fract(u_xlat16_5);
    u_xlat0.x = u_xlat0.x * 0.400000006 + 0.800000012;
    u_xlat0.xy = u_xlat0.xx * vec2(_SwitchOnOffDuration.x, _SwitchOnOffDuration.y);
    u_xlat3.x = u_xlat0.y + u_xlat0.x;
    u_xlat6 = u_xlat16_2 * 40.0 + _Time.y;
    u_xlat6 = u_xlat6 / u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb9 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlat3.x = u_xlat3.x * u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat3.x<u_xlat0.x);
#else
    u_xlatb0.x = u_xlat3.x<u_xlat0.x;
#endif
    u_xlat3.x = _Time.y * _BlinkingRate;
    u_xlat3.xy = u_xlat3.xx * vec2(5.0, 3.0);
    u_xlat6 = u_xlat16_2 * 40.0 + u_xlat3.y;
    u_xlat3.y = u_xlat6 + 7.99300003;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat6 = u_xlat3.y * 10.0;
    u_xlat3.x = u_xlat3.x * 17.0 + u_xlat6;
    u_xlat3.x = cos(u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(0.5<abs(u_xlat3.x));
#else
    u_xlatb0.y = 0.5<abs(u_xlat3.x);
#endif
    u_xlat0.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xy));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * in_COLOR0;
    u_xlat0 = u_xlat0 * _IntensityScaleBias.xxxx + _IntensityScaleBias.yyyy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD1;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 _IntensityScaleBias;
uniform 	vec2 _SwitchOnOffDuration;
uniform 	float _BlinkingRate;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_5;
float u_xlat6;
bool u_xlatb9;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = dot(in_COLOR0, in_COLOR0);
    u_xlat16_5 = u_xlat16_2 * 40.0;
    u_xlat0.x = fract(u_xlat16_5);
    u_xlat0.x = u_xlat0.x * 0.400000006 + 0.800000012;
    u_xlat0.xy = u_xlat0.xx * vec2(_SwitchOnOffDuration.x, _SwitchOnOffDuration.y);
    u_xlat3.x = u_xlat0.y + u_xlat0.x;
    u_xlat6 = u_xlat16_2 * 40.0 + _Time.y;
    u_xlat6 = u_xlat6 / u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb9 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = fract(abs(u_xlat6));
    u_xlat6 = (u_xlatb9) ? u_xlat6 : (-u_xlat6);
    u_xlat3.x = u_xlat3.x * u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat3.x<u_xlat0.x);
#else
    u_xlatb0.x = u_xlat3.x<u_xlat0.x;
#endif
    u_xlat3.x = _Time.y * _BlinkingRate;
    u_xlat3.xy = u_xlat3.xx * vec2(5.0, 3.0);
    u_xlat6 = u_xlat16_2 * 40.0 + u_xlat3.y;
    u_xlat3.y = u_xlat6 + 7.99300003;
    u_xlat3.xy = sin(u_xlat3.xy);
    u_xlat6 = u_xlat3.y * 10.0;
    u_xlat3.x = u_xlat3.x * 17.0 + u_xlat6;
    u_xlat3.x = cos(u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(0.5<abs(u_xlat3.x));
#else
    u_xlatb0.y = 0.5<abs(u_xlat3.x);
#endif
    u_xlat0.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xy));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat0 = u_xlat0.xxxx * in_COLOR0;
    u_xlat0 = u_xlat0 * _IntensityScaleBias.xxxx + _IntensityScaleBias.yyyy;
    vs_TEXCOORD1 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_TEXCOORD1;
    SV_Target0 = u_xlat16_0;
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