//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Reflective/VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_ReflectColor ("Reflection Color", Color) = (1,1,1,0.5)
_MainTex ("Base (RGB) RefStrength (A)", 2D) = "white" { }
_Cube ("Reflection Cubemap", Cube) = "_Skybox" { }
}
SubShader {
 LOD 150
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "BASE"
  LOD 150
  Tags { "LIGHTMODE" = "ALWAYS" "RenderType" = "Opaque" }
  GpuProgramID 3966
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  highp vec3 I_4;
  I_4 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_4 - (2.0 * (
    dot (tmpvar_3, I_4)
   * tmpvar_3)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz;
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  highp vec3 I_4;
  I_4 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_4 - (2.0 * (
    dot (tmpvar_3, I_4)
   * tmpvar_3)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz;
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_2;
  tmpvar_2[0] = unity_WorldToObject[0].xyz;
  tmpvar_2[1] = unity_WorldToObject[1].xyz;
  tmpvar_2[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_glesNormal * tmpvar_2));
  highp vec3 I_4;
  I_4 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_4 - (2.0 * (
    dot (tmpvar_3, I_4)
   * tmpvar_3)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 col_1;
  col_1.xyz = ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz;
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  highp vec3 I_5;
  I_5 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_5 - (2.0 * (
    dot (tmpvar_4, I_5)
   * tmpvar_4)));
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz, vec3(tmpvar_2));
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  highp vec3 I_5;
  I_5 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_5 - (2.0 * (
    dot (tmpvar_4, I_5)
   * tmpvar_4)));
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz, vec3(tmpvar_2));
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_WorldToObject[0].xyz;
  tmpvar_3[1] = unity_WorldToObject[1].xyz;
  tmpvar_3[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = normalize((_glesNormal * tmpvar_3));
  highp vec3 I_5;
  I_5 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  gl_Position = tmpvar_1;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (I_5 - (2.0 * (
    dot (tmpvar_4, I_5)
   * tmpvar_4)));
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  highp float tmpvar_2;
  tmpvar_2 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, ((textureCube (_Cube, xlv_TEXCOORD1) * texture2D (_MainTex, xlv_TEXCOORD0).w) * _ReflectColor).xyz, vec3(tmpvar_2));
  col_1.w = 1.0;
  gl_FragData[0] = col_1;
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
}
}
 Pass {
  LOD 150
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  ZWrite Off
  Lighting On
  GpuProgramID 73711
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp vec3 lightColor_8;
  highp vec3 viewN_9;
  highp vec3 viewpos_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5.xyz;
  viewpos_10 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_11)).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  viewN_9 = normalize((tmpvar_12 * _glesNormal));
  lowp vec3 tmpvar_13;
  tmpvar_13 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_8 = tmpvar_13;
  highp vec3 toLight_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = (unity_LightPosition[0].xyz - (viewpos_10 * unity_LightPosition[0].w));
  highp float tmpvar_16;
  tmpvar_16 = max (dot (tmpvar_15, tmpvar_15), 1e-06);
  toLight_14 = (tmpvar_15 * inversesqrt(tmpvar_16));
  lightColor_8 = (lightColor_8 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_9, toLight_14))
   * 
    ((1.0/((1.0 + (tmpvar_16 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_14, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (unity_LightPosition[1].xyz - (viewpos_10 * unity_LightPosition[1].w));
  highp float tmpvar_19;
  tmpvar_19 = max (dot (tmpvar_18, tmpvar_18), 1e-06);
  toLight_17 = (tmpvar_18 * inversesqrt(tmpvar_19));
  lightColor_8 = (lightColor_8 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_9, toLight_17))
   * 
    ((1.0/((1.0 + (tmpvar_19 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_17, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_LightPosition[2].xyz - (viewpos_10 * unity_LightPosition[2].w));
  highp float tmpvar_22;
  tmpvar_22 = max (dot (tmpvar_21, tmpvar_21), 1e-06);
  toLight_20 = (tmpvar_21 * inversesqrt(tmpvar_22));
  lightColor_8 = (lightColor_8 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_9, toLight_20))
   * 
    ((1.0/((1.0 + (tmpvar_22 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_20, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_LightPosition[3].xyz - (viewpos_10 * unity_LightPosition[3].w));
  highp float tmpvar_25;
  tmpvar_25 = max (dot (tmpvar_24, tmpvar_24), 1e-06);
  toLight_23 = (tmpvar_24 * inversesqrt(tmpvar_25));
  lightColor_8 = (lightColor_8 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_9, toLight_23))
   * 
    ((1.0/((1.0 + (tmpvar_25 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_23, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_26;
  tmpvar_26.xyz = lightColor_8;
  tmpvar_26.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_26 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * xlv_COLOR0.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp vec3 lightColor_8;
  highp vec3 viewN_9;
  highp vec3 viewpos_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5.xyz;
  viewpos_10 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_11)).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  viewN_9 = normalize((tmpvar_12 * _glesNormal));
  lowp vec3 tmpvar_13;
  tmpvar_13 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_8 = tmpvar_13;
  highp vec3 toLight_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = (unity_LightPosition[0].xyz - (viewpos_10 * unity_LightPosition[0].w));
  highp float tmpvar_16;
  tmpvar_16 = max (dot (tmpvar_15, tmpvar_15), 1e-06);
  toLight_14 = (tmpvar_15 * inversesqrt(tmpvar_16));
  lightColor_8 = (lightColor_8 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_9, toLight_14))
   * 
    ((1.0/((1.0 + (tmpvar_16 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_14, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (unity_LightPosition[1].xyz - (viewpos_10 * unity_LightPosition[1].w));
  highp float tmpvar_19;
  tmpvar_19 = max (dot (tmpvar_18, tmpvar_18), 1e-06);
  toLight_17 = (tmpvar_18 * inversesqrt(tmpvar_19));
  lightColor_8 = (lightColor_8 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_9, toLight_17))
   * 
    ((1.0/((1.0 + (tmpvar_19 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_17, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_LightPosition[2].xyz - (viewpos_10 * unity_LightPosition[2].w));
  highp float tmpvar_22;
  tmpvar_22 = max (dot (tmpvar_21, tmpvar_21), 1e-06);
  toLight_20 = (tmpvar_21 * inversesqrt(tmpvar_22));
  lightColor_8 = (lightColor_8 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_9, toLight_20))
   * 
    ((1.0/((1.0 + (tmpvar_22 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_20, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_LightPosition[3].xyz - (viewpos_10 * unity_LightPosition[3].w));
  highp float tmpvar_25;
  tmpvar_25 = max (dot (tmpvar_24, tmpvar_24), 1e-06);
  toLight_23 = (tmpvar_24 * inversesqrt(tmpvar_25));
  lightColor_8 = (lightColor_8 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_9, toLight_23))
   * 
    ((1.0/((1.0 + (tmpvar_25 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_23, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_26;
  tmpvar_26.xyz = lightColor_8;
  tmpvar_26.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_26 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * xlv_COLOR0.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = tmpvar_5.xyz;
  highp vec3 lightColor_8;
  highp vec3 viewN_9;
  highp vec3 viewpos_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = tmpvar_5.xyz;
  viewpos_10 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_11)).xyz;
  highp mat3 tmpvar_12;
  tmpvar_12[0] = tmpvar_2.xyz;
  tmpvar_12[1] = tmpvar_3.xyz;
  tmpvar_12[2] = tmpvar_4.xyz;
  viewN_9 = normalize((tmpvar_12 * _glesNormal));
  lowp vec3 tmpvar_13;
  tmpvar_13 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_8 = tmpvar_13;
  highp vec3 toLight_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = (unity_LightPosition[0].xyz - (viewpos_10 * unity_LightPosition[0].w));
  highp float tmpvar_16;
  tmpvar_16 = max (dot (tmpvar_15, tmpvar_15), 1e-06);
  toLight_14 = (tmpvar_15 * inversesqrt(tmpvar_16));
  lightColor_8 = (lightColor_8 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_9, toLight_14))
   * 
    ((1.0/((1.0 + (tmpvar_16 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_14, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = (unity_LightPosition[1].xyz - (viewpos_10 * unity_LightPosition[1].w));
  highp float tmpvar_19;
  tmpvar_19 = max (dot (tmpvar_18, tmpvar_18), 1e-06);
  toLight_17 = (tmpvar_18 * inversesqrt(tmpvar_19));
  lightColor_8 = (lightColor_8 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_9, toLight_17))
   * 
    ((1.0/((1.0 + (tmpvar_19 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_17, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_20;
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_LightPosition[2].xyz - (viewpos_10 * unity_LightPosition[2].w));
  highp float tmpvar_22;
  tmpvar_22 = max (dot (tmpvar_21, tmpvar_21), 1e-06);
  toLight_20 = (tmpvar_21 * inversesqrt(tmpvar_22));
  lightColor_8 = (lightColor_8 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_9, toLight_20))
   * 
    ((1.0/((1.0 + (tmpvar_22 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_20, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_23;
  highp vec3 tmpvar_24;
  tmpvar_24 = (unity_LightPosition[3].xyz - (viewpos_10 * unity_LightPosition[3].w));
  highp float tmpvar_25;
  tmpvar_25 = max (dot (tmpvar_24, tmpvar_24), 1e-06);
  toLight_23 = (tmpvar_24 * inversesqrt(tmpvar_25));
  lightColor_8 = (lightColor_8 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_9, toLight_23))
   * 
    ((1.0/((1.0 + (tmpvar_25 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_23, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_26;
  tmpvar_26.xyz = lightColor_8;
  tmpvar_26.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_26 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * xlv_COLOR0.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_5.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp vec3 lightColor_9;
  highp vec3 viewN_10;
  highp vec3 viewpos_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  viewpos_11 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_12)).xyz;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  viewN_10 = normalize((tmpvar_13 * _glesNormal));
  lowp vec3 tmpvar_14;
  tmpvar_14 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_9 = tmpvar_14;
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[0].xyz - (viewpos_11 * unity_LightPosition[0].w));
  highp float tmpvar_17;
  tmpvar_17 = max (dot (tmpvar_16, tmpvar_16), 1e-06);
  toLight_15 = (tmpvar_16 * inversesqrt(tmpvar_17));
  lightColor_9 = (lightColor_9 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_10, toLight_15))
   * 
    ((1.0/((1.0 + (tmpvar_17 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_15, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[1].xyz - (viewpos_11 * unity_LightPosition[1].w));
  highp float tmpvar_20;
  tmpvar_20 = max (dot (tmpvar_19, tmpvar_19), 1e-06);
  toLight_18 = (tmpvar_19 * inversesqrt(tmpvar_20));
  lightColor_9 = (lightColor_9 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_10, toLight_18))
   * 
    ((1.0/((1.0 + (tmpvar_20 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_18, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_LightPosition[2].xyz - (viewpos_11 * unity_LightPosition[2].w));
  highp float tmpvar_23;
  tmpvar_23 = max (dot (tmpvar_22, tmpvar_22), 1e-06);
  toLight_21 = (tmpvar_22 * inversesqrt(tmpvar_23));
  lightColor_9 = (lightColor_9 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_10, toLight_21))
   * 
    ((1.0/((1.0 + (tmpvar_23 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_21, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_LightPosition[3].xyz - (viewpos_11 * unity_LightPosition[3].w));
  highp float tmpvar_26;
  tmpvar_26 = max (dot (tmpvar_25, tmpvar_25), 1e-06);
  toLight_24 = (tmpvar_25 * inversesqrt(tmpvar_26));
  lightColor_9 = (lightColor_9 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_10, toLight_24))
   * 
    ((1.0/((1.0 + (tmpvar_26 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_24, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_27;
  tmpvar_27.xyz = lightColor_9;
  tmpvar_27.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_27 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.xyz = (tmpvar_2.xyz * xlv_COLOR0.xyz);
  c_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_3));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_5.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp vec3 lightColor_9;
  highp vec3 viewN_10;
  highp vec3 viewpos_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  viewpos_11 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_12)).xyz;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  viewN_10 = normalize((tmpvar_13 * _glesNormal));
  lowp vec3 tmpvar_14;
  tmpvar_14 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_9 = tmpvar_14;
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[0].xyz - (viewpos_11 * unity_LightPosition[0].w));
  highp float tmpvar_17;
  tmpvar_17 = max (dot (tmpvar_16, tmpvar_16), 1e-06);
  toLight_15 = (tmpvar_16 * inversesqrt(tmpvar_17));
  lightColor_9 = (lightColor_9 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_10, toLight_15))
   * 
    ((1.0/((1.0 + (tmpvar_17 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_15, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[1].xyz - (viewpos_11 * unity_LightPosition[1].w));
  highp float tmpvar_20;
  tmpvar_20 = max (dot (tmpvar_19, tmpvar_19), 1e-06);
  toLight_18 = (tmpvar_19 * inversesqrt(tmpvar_20));
  lightColor_9 = (lightColor_9 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_10, toLight_18))
   * 
    ((1.0/((1.0 + (tmpvar_20 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_18, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_LightPosition[2].xyz - (viewpos_11 * unity_LightPosition[2].w));
  highp float tmpvar_23;
  tmpvar_23 = max (dot (tmpvar_22, tmpvar_22), 1e-06);
  toLight_21 = (tmpvar_22 * inversesqrt(tmpvar_23));
  lightColor_9 = (lightColor_9 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_10, toLight_21))
   * 
    ((1.0/((1.0 + (tmpvar_23 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_21, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_LightPosition[3].xyz - (viewpos_11 * unity_LightPosition[3].w));
  highp float tmpvar_26;
  tmpvar_26 = max (dot (tmpvar_25, tmpvar_25), 1e-06);
  toLight_24 = (tmpvar_25 * inversesqrt(tmpvar_26));
  lightColor_9 = (lightColor_9 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_10, toLight_24))
   * 
    ((1.0/((1.0 + (tmpvar_26 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_24, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_27;
  tmpvar_27.xyz = lightColor_9;
  tmpvar_27.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_27 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.xyz = (tmpvar_2.xyz * xlv_COLOR0.xyz);
  c_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_3));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp vec4 unity_SpotDirection[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _Color;
uniform lowp vec4 _ReflectColor;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  highp mat4 m_1;
  m_1 = (unity_WorldToObject * unity_MatrixInvV);
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_2.x = m_1[0].x;
  tmpvar_2.y = m_1[1].x;
  tmpvar_2.z = m_1[2].x;
  tmpvar_2.w = m_1[3].x;
  tmpvar_3.x = m_1[0].y;
  tmpvar_3.y = m_1[1].y;
  tmpvar_3.z = m_1[2].y;
  tmpvar_3.w = m_1[3].y;
  tmpvar_4.x = m_1[0].z;
  tmpvar_4.y = m_1[1].z;
  tmpvar_4.z = m_1[2].z;
  tmpvar_4.w = m_1[3].z;
  highp vec4 tmpvar_5;
  tmpvar_5 = _glesVertex;
  lowp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_5.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp vec3 lightColor_9;
  highp vec3 viewN_10;
  highp vec3 viewpos_11;
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  viewpos_11 = (unity_MatrixV * (unity_ObjectToWorld * tmpvar_12)).xyz;
  highp mat3 tmpvar_13;
  tmpvar_13[0] = tmpvar_2.xyz;
  tmpvar_13[1] = tmpvar_3.xyz;
  tmpvar_13[2] = tmpvar_4.xyz;
  viewN_10 = normalize((tmpvar_13 * _glesNormal));
  lowp vec3 tmpvar_14;
  tmpvar_14 = (glstate_lightmodel_ambient * 2.0).xyz;
  lightColor_9 = tmpvar_14;
  highp vec3 toLight_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = (unity_LightPosition[0].xyz - (viewpos_11 * unity_LightPosition[0].w));
  highp float tmpvar_17;
  tmpvar_17 = max (dot (tmpvar_16, tmpvar_16), 1e-06);
  toLight_15 = (tmpvar_16 * inversesqrt(tmpvar_17));
  lightColor_9 = (lightColor_9 + (unity_LightColor[0].xyz * (
    max (0.0, dot (viewN_10, toLight_15))
   * 
    ((1.0/((1.0 + (tmpvar_17 * unity_LightAtten[0].z)))) * clamp (((
      max (0.0, dot (toLight_15, unity_SpotDirection[0].xyz))
     - unity_LightAtten[0].x) * unity_LightAtten[0].y), 0.0, 1.0))
  )));
  highp vec3 toLight_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = (unity_LightPosition[1].xyz - (viewpos_11 * unity_LightPosition[1].w));
  highp float tmpvar_20;
  tmpvar_20 = max (dot (tmpvar_19, tmpvar_19), 1e-06);
  toLight_18 = (tmpvar_19 * inversesqrt(tmpvar_20));
  lightColor_9 = (lightColor_9 + (unity_LightColor[1].xyz * (
    max (0.0, dot (viewN_10, toLight_18))
   * 
    ((1.0/((1.0 + (tmpvar_20 * unity_LightAtten[1].z)))) * clamp (((
      max (0.0, dot (toLight_18, unity_SpotDirection[1].xyz))
     - unity_LightAtten[1].x) * unity_LightAtten[1].y), 0.0, 1.0))
  )));
  highp vec3 toLight_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = (unity_LightPosition[2].xyz - (viewpos_11 * unity_LightPosition[2].w));
  highp float tmpvar_23;
  tmpvar_23 = max (dot (tmpvar_22, tmpvar_22), 1e-06);
  toLight_21 = (tmpvar_22 * inversesqrt(tmpvar_23));
  lightColor_9 = (lightColor_9 + (unity_LightColor[2].xyz * (
    max (0.0, dot (viewN_10, toLight_21))
   * 
    ((1.0/((1.0 + (tmpvar_23 * unity_LightAtten[2].z)))) * clamp (((
      max (0.0, dot (toLight_21, unity_SpotDirection[2].xyz))
     - unity_LightAtten[2].x) * unity_LightAtten[2].y), 0.0, 1.0))
  )));
  highp vec3 toLight_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (unity_LightPosition[3].xyz - (viewpos_11 * unity_LightPosition[3].w));
  highp float tmpvar_26;
  tmpvar_26 = max (dot (tmpvar_25, tmpvar_25), 1e-06);
  toLight_24 = (tmpvar_25 * inversesqrt(tmpvar_26));
  lightColor_9 = (lightColor_9 + (unity_LightColor[3].xyz * (
    max (0.0, dot (viewN_10, toLight_24))
   * 
    ((1.0/((1.0 + (tmpvar_26 * unity_LightAtten[3].z)))) * clamp (((
      max (0.0, dot (toLight_24, unity_SpotDirection[3].xyz))
     - unity_LightAtten[3].x) * unity_LightAtten[3].y), 0.0, 1.0))
  )));
  highp vec4 tmpvar_27;
  tmpvar_27.xyz = lightColor_9;
  tmpvar_27.w = _ReflectColor.w;
  tmpvar_6 = (tmpvar_27 * _Color);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_COLOR0 = tmpvar_6;
  gl_Position = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR0;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.xyz = (tmpvar_2.xyz * xlv_COLOR0.xyz);
  c_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  highp float tmpvar_3;
  tmpvar_3 = clamp (xlv_TEXCOORD1, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_3));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
}
}
 Pass {
  LOD 150
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  ZWrite Off
  GpuProgramID 163147
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.zw = vec2(0.0, 1.0);
  tmpvar_2.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_2).xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * lm_2.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.zw = vec2(0.0, 1.0);
  tmpvar_2.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_2).xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * lm_2.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_2;
  tmpvar_2.zw = vec2(0.0, 1.0);
  tmpvar_2.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_2).xy;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  c_1.xyz = (texture2D (_MainTex, xlv_TEXCOORD0).xyz * lm_2.xyz);
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_3).xy;
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_6.w;
  c_1.xyz = (tmpvar_6.xyz * lm_2.xyz);
  highp float tmpvar_7;
  tmpvar_7 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_7));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_3).xy;
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_6.w;
  c_1.xyz = (tmpvar_6.xyz * lm_2.xyz);
  highp float tmpvar_7;
  tmpvar_7 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_7));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 unity_LightmapMatrix;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 tmpvar_3;
  tmpvar_3.zw = vec2(0.0, 1.0);
  tmpvar_3.xy = _glesMultiTexCoord1.xy;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (unity_LightmapMatrix * tmpvar_3).xy;
  xlv_TEXCOORD2 = ((tmpvar_1.z * unity_FogParams.z) + unity_FogParams.w);
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform mediump sampler2D unity_Lightmap;
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 lm_2;
  lowp vec4 bakedColorTex_3;
  mediump vec4 tmpvar_4;
  tmpvar_4 = texture2D (unity_Lightmap, xlv_TEXCOORD1);
  bakedColorTex_3 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = (unity_Lightmap_HDR.x * bakedColorTex_3.xyz);
  lm_2 = tmpvar_5;
  lm_2 = (lm_2 * _Color);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_6.w;
  c_1.xyz = (tmpvar_6.xyz * lm_2.xyz);
  highp float tmpvar_7;
  tmpvar_7 = clamp (xlv_TEXCOORD2, 0.0, 1.0);
  c_1.xyz = (c_1.xyz * vec3(tmpvar_7));
  c_1.w = 1.0;
  gl_FragData[0] = c_1;
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
}
}
}
Fallback "Legacy Shaders/VertexLit"
}