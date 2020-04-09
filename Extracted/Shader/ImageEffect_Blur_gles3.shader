//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "ImageEffect/Blur" {
Properties {
_MainTex ("Texture", 2D) = "black" { }
_Multiplyer ("Mult", Float) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 18099
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Multiplyer;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_9;
float u_xlat10;
int u_xlati10;
bool u_xlatb10;
mediump float u_xlat16_16;
vec2 u_xlat17;
int u_xlati17;
bool u_xlatb17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = int(0xFFFFFFF8u) ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = int(0xFFFFFFF8u);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati10>=8);
#else
            u_xlatb17 = u_xlati10>=8;
#endif
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati17<8);
#else
            u_xlatb17 = u_xlati17<8;
#endif
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat16_6 = texture(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat16_6 * vec4(u_xlat16_16) + u_xlat16_5;
            u_xlati10 = u_xlati10 + 1;
            u_xlat16_5 = u_xlat16_5;
        }
        u_xlat16_1 = u_xlat16_5;
        u_xlat16_2 = u_xlat16_9;
    }
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    SV_Target0 = u_xlat16_1 * vec4(u_xlat16_2);
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Multiplyer;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_9;
float u_xlat10;
int u_xlati10;
bool u_xlatb10;
mediump float u_xlat16_16;
vec2 u_xlat17;
int u_xlati17;
bool u_xlatb17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = int(0xFFFFFFF8u) ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = int(0xFFFFFFF8u);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati10>=8);
#else
            u_xlatb17 = u_xlati10>=8;
#endif
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati17<8);
#else
            u_xlatb17 = u_xlati17<8;
#endif
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat16_6 = texture(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat16_6 * vec4(u_xlat16_16) + u_xlat16_5;
            u_xlati10 = u_xlati10 + 1;
            u_xlat16_5 = u_xlat16_5;
        }
        u_xlat16_1 = u_xlat16_5;
        u_xlat16_2 = u_xlat16_9;
    }
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    SV_Target0 = u_xlat16_1 * vec4(u_xlat16_2);
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
uniform 	float _Multiplyer;
uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_9;
float u_xlat10;
int u_xlati10;
bool u_xlatb10;
mediump float u_xlat16_16;
vec2 u_xlat17;
int u_xlati17;
bool u_xlatb17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = int(0xFFFFFFF8u) ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = int(0xFFFFFFF8u);
        while(true){
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati10>=8);
#else
            u_xlatb17 = u_xlati10>=8;
#endif
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
#ifdef UNITY_ADRENO_ES3
            u_xlatb17 = !!(u_xlati17<8);
#else
            u_xlatb17 = u_xlati17<8;
#endif
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat16_6 = texture(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat16_6 * vec4(u_xlat16_16) + u_xlat16_5;
            u_xlati10 = u_xlati10 + 1;
            u_xlat16_5 = u_xlat16_5;
        }
        u_xlat16_1 = u_xlat16_5;
        u_xlat16_2 = u_xlat16_9;
    }
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    SV_Target0 = u_xlat16_1 * vec4(u_xlat16_2);
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