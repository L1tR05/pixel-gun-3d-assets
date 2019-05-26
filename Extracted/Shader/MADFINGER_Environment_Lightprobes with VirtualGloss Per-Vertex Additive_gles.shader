//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MADFINGER/Environment/Lightprobes with VirtualGloss Per-Vertex Additive" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_SpecOffset ("Specular Offset from Camera", Vector) = (1,10,2,0)
_SpecRange ("Specular Range", Float) = 20
_SpecColor ("Specular Color", Color) = (1,1,1,1)
_Shininess ("Shininess", Range(0.01, 1)) = 0.078125
_SHLightingScale ("LightProbe influence scale", Float) = 1
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 63926
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
highp mat4 unity_MatrixMV;
uniform highp vec3 _SpecOffset;
uniform highp float _SpecRange;
uniform highp vec3 _SpecColor;
uniform highp float _Shininess;
uniform highp float _SHLightingScale;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  unity_MatrixMV = (unity_MatrixV * unity_ObjectToWorld);
  highp vec3 tmpvar_1;
  lowp vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_5[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_5[2] = unity_ObjectToWorld[2].xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_MatrixMV[0].xyz;
  tmpvar_6[1] = unity_MatrixMV[1].xyz;
  tmpvar_6[2] = unity_MatrixMV[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = ((unity_MatrixMV * _glesVertex).xyz - (_SpecOffset * vec3(1.0, 1.0, -1.0)));
  highp float tmpvar_8;
  tmpvar_8 = (1.0 - clamp ((
    sqrt(dot (tmpvar_7, tmpvar_7))
   / _SpecRange), 0.0, 1.0));
  highp float tmpvar_9;
  tmpvar_9 = pow (clamp (dot (
    (tmpvar_6 * _glesNormal)
  , 
    normalize(((vec3(0.0, 0.0, 1.0) + normalize(
      -(tmpvar_7)
    )) * 0.5))
  ), 0.0, 1.0), (_Shininess * 128.0));
  tmpvar_2 = ((_SpecColor * tmpvar_9) * (2.0 * tmpvar_8));
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = (tmpvar_5 * _glesNormal);
  mediump vec4 normal_11;
  normal_11 = tmpvar_10;
  mediump vec3 res_12;
  mediump vec3 x_13;
  x_13.x = dot (unity_SHAr, normal_11);
  x_13.y = dot (unity_SHAg, normal_11);
  x_13.z = dot (unity_SHAb, normal_11);
  mediump vec3 x1_14;
  mediump vec4 tmpvar_15;
  tmpvar_15 = (normal_11.xyzz * normal_11.yzzx);
  x1_14.x = dot (unity_SHBr, tmpvar_15);
  x1_14.y = dot (unity_SHBg, tmpvar_15);
  x1_14.z = dot (unity_SHBb, tmpvar_15);
  res_12 = (x_13 + (x1_14 + (unity_SHC.xyz * 
    ((normal_11.x * normal_11.x) - (normal_11.y * normal_11.y))
  )));
  mediump vec3 tmpvar_16;
  tmpvar_16 = max (((1.055 * 
    pow (max (res_12, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_12 = tmpvar_16;
  tmpvar_3 = (tmpvar_16 * _SHLightingScale);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_1;
  xlv_TEXCOORD3 = tmpvar_2;
  xlv_TEXCOORD4 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  c_1.w = tmpvar_2.w;
  c_1.xyz = (tmpvar_2.xyz * xlv_TEXCOORD4);
  c_1.xyz = (c_1.xyz + (xlv_TEXCOORD3 * tmpvar_2.w));
  gl_FragData[0] = c_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" }
""
}
}
}
}
}