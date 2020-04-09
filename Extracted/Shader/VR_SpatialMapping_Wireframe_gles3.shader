//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "VR/SpatialMapping/Wireframe" {
Properties {
_WireThickness ("Wire Thickness", Range(0, 800)) = 100
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 23880
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 310 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
layout(location = 0) out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
vec3 ImmCB_0_0_0[11];
uniform 	vec3 _WorldSpaceCameraPos;
layout(location = 0) in highp vec4 gs_TEXCOORD0;
layout(location = 1) in highp vec4 gs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb2;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 1.0, 1.0);
	ImmCB_0_0_0[1] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[4] = vec3(1.0, 1.0, 0.0);
	ImmCB_0_0_0[5] = vec3(0.0, 1.0, 1.0);
	ImmCB_0_0_0[6] = vec3(1.0, 0.0, 1.0);
	ImmCB_0_0_0[7] = vec3(0.5, 0.0, 0.0);
	ImmCB_0_0_0[8] = vec3(0.0, 0.5, 0.5);
	ImmCB_0_0_0[9] = vec3(1.0, 0.649999976, 0.0);
	ImmCB_0_0_0[10] = vec3(1.0, 1.0, 1.0);
    u_xlat0.x = min(gs_TEXCOORD1.z, gs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, gs_TEXCOORD1.x);
    u_xlat0.x = u_xlat0.x * gs_TEXCOORD1.w;
    u_xlatb2 = 0.899999976<u_xlat0.x;
    if(u_xlatb2){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    //ENDIF
    }
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 10.0);
    u_xlati1 = int(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.www * ImmCB_0_0_0[u_xlati1].xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

uniform 	float _WireThickness;
layout(location = 0) in highp vec4 vs_TEXCOORD1 [3];
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
float u_xlat4;
float u_xlat6;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec4 gs_TEXCOORD0;
layout(location = 1) out highp vec4 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[0];
    u_xlat0.xy = gl_in[1].gl_Position.xy / gl_in[1].gl_Position.ww;
    u_xlat0.zw = gl_in[2].gl_Position.xy / gl_in[2].gl_Position.ww;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3.xy = gl_in[0].gl_Position.xy / gl_in[0].gl_Position.ww;
    u_xlat0 = u_xlat0 + (-u_xlat3.xyxy);
    u_xlat3.x = u_xlat0.x * u_xlat0.w;
    u_xlat3.x = u_xlat0.z * u_xlat0.y + (-u_xlat3.x);
    u_xlat4 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat4 = abs(u_xlat3.x) / u_xlat4;
    u_xlat4 = u_xlat4 * gl_in[1].gl_Position.w;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = abs(u_xlat3.x) / u_xlat0.x;
    u_xlat2 = abs(u_xlat3.x) / u_xlat1.x;
    u_xlat2 = u_xlat2 * gl_in[0].gl_Position.w;
    u_xlat0.x = u_xlat0.x * gl_in[2].gl_Position.w;
    u_xlat6 = (-_WireThickness) + 800.0;
    u_xlat1.x = u_xlat6 * u_xlat2;
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2 = float(1.0) / gl_in[0].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat2;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[1];
    u_xlat1.y = u_xlat6 * u_xlat4;
    u_xlat0.z = u_xlat6 * u_xlat0.x;
    u_xlat1.x = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat6 = float(1.0) / gl_in[1].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat6;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[2];
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = float(1.0) / gl_in[2].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat0.x;
    EmitVertex();
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 310 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
layout(location = 0) out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
vec3 ImmCB_0_0_0[11];
uniform 	vec3 _WorldSpaceCameraPos;
layout(location = 0) in highp vec4 gs_TEXCOORD0;
layout(location = 1) in highp vec4 gs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb2;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 1.0, 1.0);
	ImmCB_0_0_0[1] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[4] = vec3(1.0, 1.0, 0.0);
	ImmCB_0_0_0[5] = vec3(0.0, 1.0, 1.0);
	ImmCB_0_0_0[6] = vec3(1.0, 0.0, 1.0);
	ImmCB_0_0_0[7] = vec3(0.5, 0.0, 0.0);
	ImmCB_0_0_0[8] = vec3(0.0, 0.5, 0.5);
	ImmCB_0_0_0[9] = vec3(1.0, 0.649999976, 0.0);
	ImmCB_0_0_0[10] = vec3(1.0, 1.0, 1.0);
    u_xlat0.x = min(gs_TEXCOORD1.z, gs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, gs_TEXCOORD1.x);
    u_xlat0.x = u_xlat0.x * gs_TEXCOORD1.w;
    u_xlatb2 = 0.899999976<u_xlat0.x;
    if(u_xlatb2){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    //ENDIF
    }
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 10.0);
    u_xlati1 = int(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.www * ImmCB_0_0_0[u_xlati1].xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

uniform 	float _WireThickness;
layout(location = 0) in highp vec4 vs_TEXCOORD1 [3];
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
float u_xlat4;
float u_xlat6;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec4 gs_TEXCOORD0;
layout(location = 1) out highp vec4 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[0];
    u_xlat0.xy = gl_in[1].gl_Position.xy / gl_in[1].gl_Position.ww;
    u_xlat0.zw = gl_in[2].gl_Position.xy / gl_in[2].gl_Position.ww;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3.xy = gl_in[0].gl_Position.xy / gl_in[0].gl_Position.ww;
    u_xlat0 = u_xlat0 + (-u_xlat3.xyxy);
    u_xlat3.x = u_xlat0.x * u_xlat0.w;
    u_xlat3.x = u_xlat0.z * u_xlat0.y + (-u_xlat3.x);
    u_xlat4 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat4 = abs(u_xlat3.x) / u_xlat4;
    u_xlat4 = u_xlat4 * gl_in[1].gl_Position.w;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = abs(u_xlat3.x) / u_xlat0.x;
    u_xlat2 = abs(u_xlat3.x) / u_xlat1.x;
    u_xlat2 = u_xlat2 * gl_in[0].gl_Position.w;
    u_xlat0.x = u_xlat0.x * gl_in[2].gl_Position.w;
    u_xlat6 = (-_WireThickness) + 800.0;
    u_xlat1.x = u_xlat6 * u_xlat2;
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2 = float(1.0) / gl_in[0].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat2;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[1];
    u_xlat1.y = u_xlat6 * u_xlat4;
    u_xlat0.z = u_xlat6 * u_xlat0.x;
    u_xlat1.x = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat6 = float(1.0) / gl_in[1].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat6;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[2];
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = float(1.0) / gl_in[2].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat0.x;
    EmitVertex();
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 310 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
layout(location = 0) out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

precision highp float;
precision highp int;
vec3 ImmCB_0_0_0[11];
uniform 	vec3 _WorldSpaceCameraPos;
layout(location = 0) in highp vec4 gs_TEXCOORD0;
layout(location = 1) in highp vec4 gs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb2;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 1.0, 1.0);
	ImmCB_0_0_0[1] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[4] = vec3(1.0, 1.0, 0.0);
	ImmCB_0_0_0[5] = vec3(0.0, 1.0, 1.0);
	ImmCB_0_0_0[6] = vec3(1.0, 0.0, 1.0);
	ImmCB_0_0_0[7] = vec3(0.5, 0.0, 0.0);
	ImmCB_0_0_0[8] = vec3(0.0, 0.5, 0.5);
	ImmCB_0_0_0[9] = vec3(1.0, 0.649999976, 0.0);
	ImmCB_0_0_0[10] = vec3(1.0, 1.0, 1.0);
    u_xlat0.x = min(gs_TEXCOORD1.z, gs_TEXCOORD1.y);
    u_xlat0.x = min(u_xlat0.x, gs_TEXCOORD1.x);
    u_xlat0.x = u_xlat0.x * gs_TEXCOORD1.w;
    u_xlatb2 = 0.899999976<u_xlat0.x;
    if(u_xlatb2){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    //ENDIF
    }
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat0.w = exp2(u_xlat0.x);
    u_xlat1.xyz = (-gs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 10.0);
    u_xlati1 = int(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.www * ImmCB_0_0_0[u_xlati1].xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

uniform 	float _WireThickness;
layout(location = 0) in highp vec4 vs_TEXCOORD1 [3];
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
float u_xlat4;
float u_xlat6;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec4 gs_TEXCOORD0;
layout(location = 1) out highp vec4 gs_TEXCOORD1;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[0];
    u_xlat0.xy = gl_in[1].gl_Position.xy / gl_in[1].gl_Position.ww;
    u_xlat0.zw = gl_in[2].gl_Position.xy / gl_in[2].gl_Position.ww;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat3.xy = gl_in[0].gl_Position.xy / gl_in[0].gl_Position.ww;
    u_xlat0 = u_xlat0 + (-u_xlat3.xyxy);
    u_xlat3.x = u_xlat0.x * u_xlat0.w;
    u_xlat3.x = u_xlat0.z * u_xlat0.y + (-u_xlat3.x);
    u_xlat4 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat4 = sqrt(u_xlat4);
    u_xlat4 = abs(u_xlat3.x) / u_xlat4;
    u_xlat4 = u_xlat4 * gl_in[1].gl_Position.w;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = abs(u_xlat3.x) / u_xlat0.x;
    u_xlat2 = abs(u_xlat3.x) / u_xlat1.x;
    u_xlat2 = u_xlat2 * gl_in[0].gl_Position.w;
    u_xlat0.x = u_xlat0.x * gl_in[2].gl_Position.w;
    u_xlat6 = (-_WireThickness) + 800.0;
    u_xlat1.x = u_xlat6 * u_xlat2;
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2 = float(1.0) / gl_in[0].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat2;
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[1];
    u_xlat1.y = u_xlat6 * u_xlat4;
    u_xlat0.z = u_xlat6 * u_xlat0.x;
    u_xlat1.x = float(0.0);
    u_xlat1.z = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat6 = float(1.0) / gl_in[1].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat6;
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0 = vs_TEXCOORD1[2];
    u_xlat0.x = float(0.0);
    u_xlat0.y = float(0.0);
    gs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = float(1.0) / gl_in[2].gl_Position.w;
    gs_TEXCOORD1.w = u_xlat0.x;
    EmitVertex();
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
Program "gp" {
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