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
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Multiplyer;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_6;
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
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = -8 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = -8;
        for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
            u_xlatb17 = u_xlati10>=8;
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
            u_xlatb17 = u_xlati17<8;
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat10_6 = texture2D(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat10_6 * vec4(u_xlat16_16) + u_xlat16_5;
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
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Multiplyer;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_6;
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
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = -8 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = -8;
        for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
            u_xlatb17 = u_xlati10>=8;
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
            u_xlatb17 = u_xlati17<8;
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat10_6 = texture2D(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat10_6 * vec4(u_xlat16_16) + u_xlat16_5;
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
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Multiplyer;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
int u_xlati3;
vec2 u_xlat4;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_6;
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
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat10_0;
    u_xlat16_2 = 1.0;
    for(int u_xlati_loop_1 = -8 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat10 = float(u_xlati_loop_1);
        u_xlat4.x = u_xlat10 * _Multiplyer;
        u_xlat16_5 = u_xlat16_1;
        u_xlat16_9 = u_xlat16_2;
        u_xlati10 = -8;
        for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
            u_xlatb17 = u_xlati10>=8;
            if(u_xlatb17){break;}
            u_xlati17 = u_xlati_loop_1 + u_xlati10;
            u_xlatb17 = u_xlati17<8;
            u_xlat16_16 = (u_xlatb17) ? 1.0 : 0.0;
            u_xlat16_9 = u_xlat16_16 + u_xlat16_9;
            u_xlat17.x = float(u_xlati10);
            u_xlat4.y = u_xlat17.x * _Multiplyer;
            u_xlat17.xy = u_xlat4.xy * vec2(0.00150000001, 0.00150000001) + vs_TEXCOORD0.xy;
            u_xlat10_6 = texture2D(_MainTex, u_xlat17.xy);
            u_xlat16_5 = u_xlat10_6 * vec4(u_xlat16_16) + u_xlat16_5;
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