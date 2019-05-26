//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Cube env map (Supports Lightmap)" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_EnvTex ("Cube env tex", Cube) = "black" { }
_Spread ("Spread", Range(0.1, 0.5)) = 0.5
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 40872
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_3[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_3[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * _glesNormal);
  highp vec3 tmpvar_5;
  highp vec3 I_6;
  I_6 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_5 = (I_6 - (2.0 * (
    dot (tmpvar_4, I_6)
   * tmpvar_4)));
  tmpvar_1.yz = tmpvar_5.yz;
  tmpvar_1.x = -(tmpvar_5.x);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _EnvTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz + (textureCube (_EnvTex, xlv_TEXCOORD2) * tmpvar_2.w).xyz);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_3[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_3[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * _glesNormal);
  highp vec3 tmpvar_5;
  highp vec3 I_6;
  I_6 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_5 = (I_6 - (2.0 * (
    dot (tmpvar_4, I_6)
   * tmpvar_4)));
  tmpvar_1.yz = tmpvar_5.yz;
  tmpvar_1.x = -(tmpvar_5.x);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _EnvTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz + (textureCube (_EnvTex, xlv_TEXCOORD2) * tmpvar_2.w).xyz);
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
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  highp vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_3;
  tmpvar_3[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_3[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_3[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * _glesNormal);
  highp vec3 tmpvar_5;
  highp vec3 I_6;
  I_6 = ((unity_ObjectToWorld * _glesVertex).xyz - _WorldSpaceCameraPos);
  tmpvar_5 = (I_6 - (2.0 * (
    dot (tmpvar_4, I_6)
   * tmpvar_4)));
  tmpvar_1.yz = tmpvar_5.yz;
  tmpvar_1.x = -(tmpvar_5.x);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD2 = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp samplerCube _EnvTex;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD2;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz + (textureCube (_EnvTex, xlv_TEXCOORD2) * tmpvar_2.w).xyz);
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
}
}
}
}