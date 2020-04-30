//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/ARCameraShader" {
Properties {
_textureY ("TextureY", 2D) = "white" { }
_textureCbCr ("TextureCbCr", 2D) = "black" { }
_texCoordScale ("Texture Coordinate Scale", Float) = 1
_isPortrait ("Device Orientation", Float) = 0
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  ZWrite Off
  Cull Off
  GpuProgramID 680
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _texCoordScale;
uniform 	int _isPortrait;
uniform 	vec4 hlslcc_mtx4x4_TextureRotation[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
vec2 u_xlat3;
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
    u_xlatb0 = _isPortrait==1;
    u_xlat1.x = in_TEXCOORD0.x;
    u_xlat2.y = (-in_TEXCOORD0.y);
    u_xlat3.xy = in_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat1.y = (-u_xlat3.x) * _texCoordScale + 0.5;
    u_xlat2.x = u_xlat3.y * _texCoordScale + 0.5;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat3.xy = u_xlat0.yy * hlslcc_mtx4x4_TextureRotation[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_TextureRotation[0].xy * u_xlat0.xx + u_xlat3.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy + hlslcc_mtx4x4_TextureRotation[3].xy;
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
uniform lowp sampler2D _textureY;
uniform lowp sampler2D _textureCbCr;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.w = 1.0;
    u_xlat1.x = texture2D(_textureY, vs_TEXCOORD0.xy).x;
    u_xlat1.yz = texture2D(_textureCbCr, vs_TEXCOORD0.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat0.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat0.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat0.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
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
uniform 	float _texCoordScale;
uniform 	int _isPortrait;
uniform 	vec4 hlslcc_mtx4x4_TextureRotation[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
vec2 u_xlat3;
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
    u_xlatb0 = _isPortrait==1;
    u_xlat1.x = in_TEXCOORD0.x;
    u_xlat2.y = (-in_TEXCOORD0.y);
    u_xlat3.xy = in_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat1.y = (-u_xlat3.x) * _texCoordScale + 0.5;
    u_xlat2.x = u_xlat3.y * _texCoordScale + 0.5;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat3.xy = u_xlat0.yy * hlslcc_mtx4x4_TextureRotation[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_TextureRotation[0].xy * u_xlat0.xx + u_xlat3.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy + hlslcc_mtx4x4_TextureRotation[3].xy;
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
uniform lowp sampler2D _textureY;
uniform lowp sampler2D _textureCbCr;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.w = 1.0;
    u_xlat1.x = texture2D(_textureY, vs_TEXCOORD0.xy).x;
    u_xlat1.yz = texture2D(_textureCbCr, vs_TEXCOORD0.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat0.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat0.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat0.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
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
uniform 	float _texCoordScale;
uniform 	int _isPortrait;
uniform 	vec4 hlslcc_mtx4x4_TextureRotation[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
vec2 u_xlat3;
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
    u_xlatb0 = _isPortrait==1;
    u_xlat1.x = in_TEXCOORD0.x;
    u_xlat2.y = (-in_TEXCOORD0.y);
    u_xlat3.xy = in_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat1.y = (-u_xlat3.x) * _texCoordScale + 0.5;
    u_xlat2.x = u_xlat3.y * _texCoordScale + 0.5;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat3.xy = u_xlat0.yy * hlslcc_mtx4x4_TextureRotation[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4_TextureRotation[0].xy * u_xlat0.xx + u_xlat3.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy + hlslcc_mtx4x4_TextureRotation[3].xy;
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
uniform lowp sampler2D _textureY;
uniform lowp sampler2D _textureCbCr;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.w = 1.0;
    u_xlat1.x = texture2D(_textureY, vs_TEXCOORD0.xy).x;
    u_xlat1.yz = texture2D(_textureCbCr, vs_TEXCOORD0.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat0.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat0.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat0.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
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
}
}