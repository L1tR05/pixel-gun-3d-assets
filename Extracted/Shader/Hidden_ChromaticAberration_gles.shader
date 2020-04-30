//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ChromaticAberration" {
Properties {
_MainTex ("Base", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 39291
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
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat16_1 = u_xlat10_1 + u_xlat10_3;
    u_xlat16_0 = u_xlat10_0 + u_xlat16_1;
    u_xlat16_0 = u_xlat10_2 + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
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
  GpuProgramID 93408
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
    u_xlat0.y = texture2D(_MainTex, u_xlat0.xy).y;
    u_xlat0.xzw = texture2D(_MainTex, vs_TEXCOORD0.xy).xzw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
    u_xlat0.y = texture2D(_MainTex, u_xlat0.xy).y;
    u_xlat0.xzw = texture2D(_MainTex, vs_TEXCOORD0.xy).xzw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_ChromaticAberration);
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat0.xy = (-u_xlat0.xy) * u_xlat16_1.xx + vs_TEXCOORD0.xy;
    u_xlat0.y = texture2D(_MainTex, u_xlat0.xy).y;
    u_xlat0.xzw = texture2D(_MainTex, vs_TEXCOORD0.xy).xzw;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 138378
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
vec2 ImmCB_0_0_0[9];
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform 	mediump float _AxialAberration;
uniform 	mediump float _Luminance;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
mediump float u_xlat16_8;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec2 ImmCB_0_0_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0_0_0[i];
#else
#define d_ar ImmCB_0_0_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
	ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
	ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
	ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
	ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
	ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
	ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
	ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
	ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
	ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _ChromaticAberration;
    u_xlat16_0.x = max(u_xlat16_0.x, _AxialAberration);
    u_xlat16_2.x = max(u_xlat16_0.x, -2.5);
    u_xlat16_2.x = min(u_xlat16_2.x, 2.5);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_0.xyz = u_xlat16_6.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat7.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_2.xx + vs_TEXCOORD0.xy;
        u_xlat10_7.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
        u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.108695656, 0.108695656, 0.108695656);
    u_xlat16_0.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_8 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0.x = (-u_xlat16_8) + u_xlat16_0.x;
    u_xlat16_0.x = abs(u_xlat16_0.x) * _Luminance;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = u_xlat16_0.y * 0.108695656 + (-u_xlat10_1.y);
    SV_Target0.y = u_xlat16_0.x * u_xlat16_4 + u_xlat10_1.y;
    SV_Target0.xzw = u_xlat10_1.xzw;
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
vec2 ImmCB_0_0_0[9];
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform 	mediump float _AxialAberration;
uniform 	mediump float _Luminance;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
mediump float u_xlat16_8;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec2 ImmCB_0_0_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0_0_0[i];
#else
#define d_ar ImmCB_0_0_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
	ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
	ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
	ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
	ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
	ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
	ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
	ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
	ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
	ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _ChromaticAberration;
    u_xlat16_0.x = max(u_xlat16_0.x, _AxialAberration);
    u_xlat16_2.x = max(u_xlat16_0.x, -2.5);
    u_xlat16_2.x = min(u_xlat16_2.x, 2.5);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_0.xyz = u_xlat16_6.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat7.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_2.xx + vs_TEXCOORD0.xy;
        u_xlat10_7.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
        u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.108695656, 0.108695656, 0.108695656);
    u_xlat16_0.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_8 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0.x = (-u_xlat16_8) + u_xlat16_0.x;
    u_xlat16_0.x = abs(u_xlat16_0.x) * _Luminance;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = u_xlat16_0.y * 0.108695656 + (-u_xlat10_1.y);
    SV_Target0.y = u_xlat16_0.x * u_xlat16_4 + u_xlat10_1.y;
    SV_Target0.xzw = u_xlat10_1.xzw;
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
vec2 ImmCB_0_0_0[9];
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump float _ChromaticAberration;
uniform 	mediump float _AxialAberration;
uniform 	mediump float _Luminance;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
int u_xlati3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
mediump float u_xlat16_8;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec2 ImmCB_0_0_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0_0_0[i];
#else
#define d_ar ImmCB_0_0_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
	ImmCB_0_0_0[0] = vec2(-0.926212013, -0.405809999);
	ImmCB_0_0_0[1] = vec2(-0.69591397, 0.457136989);
	ImmCB_0_0_0[2] = vec2(-0.203345001, 0.820716023);
	ImmCB_0_0_0[3] = vec2(0.962339997, -0.194983006);
	ImmCB_0_0_0[4] = vec2(0.473434001, -0.480026007);
	ImmCB_0_0_0[5] = vec2(0.519456029, 0.767022014);
	ImmCB_0_0_0[6] = vec2(0.185461, -0.893123984);
	ImmCB_0_0_0[7] = vec2(0.896420002, 0.412458003);
	ImmCB_0_0_0[8] = vec2(-0.321940005, -0.932614982);
    u_xlat16_0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_0.xy = u_xlat16_0.xy + u_xlat16_0.xy;
    u_xlat16_0.x = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _ChromaticAberration;
    u_xlat16_0.x = max(u_xlat16_0.x, _AxialAberration);
    u_xlat16_2.x = max(u_xlat16_0.x, -2.5);
    u_xlat16_2.x = min(u_xlat16_2.x, 2.5);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat16_0.xyz = u_xlat16_6.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat7.xy = _MainTex_TexelSize.xy * ImmCB_0_0_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_2.xx + vs_TEXCOORD0.xy;
        u_xlat10_7.xyz = texture2D(_MainTex, u_xlat7.xy).xyz;
        u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat10_7.xyz;
    }
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.108695656, 0.108695656, 0.108695656);
    u_xlat16_0.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_8 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0.x = (-u_xlat16_8) + u_xlat16_0.x;
    u_xlat16_0.x = abs(u_xlat16_0.x) * _Luminance;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_4 = u_xlat16_0.y * 0.108695656 + (-u_xlat10_1.y);
    SV_Target0.y = u_xlat16_0.x * u_xlat16_4 + u_xlat10_1.y;
    SV_Target0.xzw = u_xlat10_1.xzw;
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