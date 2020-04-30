//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Tri-Planar World" {
Properties {
_Side ("Side", 2D) = "white" { }
_Top ("Top", 2D) = "white" { }
_Bottom ("Bottom", 2D) = "white" { }
_SideScale ("Side Scale", Float) = 2
_TopScale ("Top Scale", Float) = 2
_BottomScale ("Bottom Scale", Float) = 2
_Color ("Color", Color) = (0.5,0.5,0.5,1)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "False" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 2488
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.w = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(u_xlat16_23) + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_6.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD1.w = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat16_5.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_5.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_6.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_6.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_6.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD2.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_FogColor;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_26 = max(u_xlat16_26, 0.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(u_xlat16_26) + u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD1.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 123411
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD4 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD4 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD4 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_23 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_23 = max(u_xlat16_23, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat0.x = vs_TEXCOORD4;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "PREPASS"
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "PREPASSBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 131549
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
varying highp vec3 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
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
  Name "PREPASS"
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "PREPASSFINAL" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 217325
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_3.x = u_xlat1.y * u_xlat1.y;
    u_xlat16_3.x = u_xlat1.x * u_xlat1.x + (-u_xlat16_3.x);
    u_xlat16_0 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_4.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_4.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_4.z = dot(unity_SHBb, u_xlat16_0);
    u_xlat16_3.xyz = unity_SHC.xyz * u_xlat16_3.xxx + u_xlat16_4.xyz;
    u_xlat1.w = 1.0;
    u_xlat16_4.x = dot(unity_SHAr, u_xlat1);
    u_xlat16_4.y = dot(unity_SHAg, u_xlat1);
    u_xlat16_4.z = dot(unity_SHAb, u_xlat1);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 unity_FogColor;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
uniform lowp sampler2D _LightBuffer;
varying highp vec3 vs_TEXCOORD0;
varying highp float vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0.xyz = texture2D(_LightBuffer, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = max(u_xlat10_0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat0.xyz = (-u_xlat16_6.xyz) + vs_TEXCOORD4.xyz;
    u_xlat21 = vs_TEXCOORD5;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_5.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + unity_FogColor.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "DEFERRED"
  Tags { "IGNOREPROJECTOR" = "False" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 277336
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb12 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb12){
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat12.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat12.xy = fract(u_xlat12.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat12.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3 = vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vs_TEXCOORD3.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_6.xyz));
    SV_Target0.xyz = u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vs_TEXCOORD3.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_6.xyz));
    SV_Target0.xyz = u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_draw_buffers
#extension GL_EXT_draw_buffers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _SideScale;
uniform 	float _TopScale;
uniform 	float _BottomScale;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Side;
uniform lowp sampler2D _Top;
uniform lowp sampler2D _Bottom;
varying highp vec3 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
#define SV_Target1 gl_FragData[1]
#define SV_Target2 gl_FragData[2]
#define SV_Target3 gl_FragData[3]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat14;
bool u_xlatb14;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.39999998, 1.39999998);
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat1 = vs_TEXCOORD1.zyxy * vec4(_SideScale);
    u_xlat1 = fract(u_xlat1);
    u_xlat10_2.xyz = texture2D(_Side, u_xlat1.xy).xyz;
    u_xlatb14 = 0.0<vs_TEXCOORD0.y;
    if(u_xlatb14){
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_TopScale, _TopScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_3.xyz = texture2D(_Top, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_3.xyz * abs(vs_TEXCOORD0.yyy);
    } else {
        u_xlat14.xy = vs_TEXCOORD1.zx * vec2(vec2(_BottomScale, _BottomScale));
        u_xlat14.xy = fract(u_xlat14.xy);
        u_xlat10_4.xyz = texture2D(_Bottom, u_xlat14.xy).xyz;
        u_xlat3.xyz = u_xlat10_4.xyz * abs(vs_TEXCOORD0.yyy);
    //ENDIF
    }
    u_xlat10_1.xyz = texture2D(_Side, u_xlat1.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * abs(vs_TEXCOORD0.zzz);
    u_xlat2.xyz = u_xlat10_2.xyz * abs(vs_TEXCOORD0.xxx) + (-u_xlat1.xyz);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xzw) + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.yyy * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_5.xyz = _Color.xyz + _Color.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vs_TEXCOORD3.xyz;
    SV_Target3.xyz = exp2((-u_xlat16_6.xyz));
    SV_Target0.xyz = u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    SV_Target3.w = 1.0;
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
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTPROBE_SH" }
""
}
}
}
}
Fallback "Diffuse"
}