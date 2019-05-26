//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Transparent Effects/CheapForcefield" {
Properties {
_Color ("_Color", Color) = (0,1,0,1)
_Inside ("_Inside", Range(0, 0.2)) = 0
_Rim ("_Rim", Range(1, 2)) = 1.2
_Texture ("_Texture", 2D) = "white" { }
_Tile ("_Tile", Range(1, 10)) = 5
_Strength ("_Strength", Range(0, 5)) = 1.5
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 35467
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  mediump vec3 normal_15;
  normal_15 = tmpvar_7;
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = normal_15;
  mediump vec3 res_17;
  mediump vec3 x_18;
  x_18.x = dot (unity_SHAr, tmpvar_16);
  x_18.y = dot (unity_SHAg, tmpvar_16);
  x_18.z = dot (unity_SHAb, tmpvar_16);
  mediump vec3 x1_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_15.xyzz * normal_15.yzzx);
  x1_19.x = dot (unity_SHBr, tmpvar_20);
  x1_19.y = dot (unity_SHBg, tmpvar_20);
  x1_19.z = dot (unity_SHBb, tmpvar_20);
  res_17 = (x_18 + (x1_19 + (unity_SHC.xyz * 
    ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y))
  )));
  mediump vec3 tmpvar_21;
  tmpvar_21 = max (((1.055 * 
    pow (max (res_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_17 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_21);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  mediump vec3 normal_15;
  normal_15 = tmpvar_7;
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = normal_15;
  mediump vec3 res_17;
  mediump vec3 x_18;
  x_18.x = dot (unity_SHAr, tmpvar_16);
  x_18.y = dot (unity_SHAg, tmpvar_16);
  x_18.z = dot (unity_SHAb, tmpvar_16);
  mediump vec3 x1_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_15.xyzz * normal_15.yzzx);
  x1_19.x = dot (unity_SHBr, tmpvar_20);
  x1_19.y = dot (unity_SHBg, tmpvar_20);
  x1_19.z = dot (unity_SHBb, tmpvar_20);
  res_17 = (x_18 + (x1_19 + (unity_SHC.xyz * 
    ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y))
  )));
  mediump vec3 tmpvar_21;
  tmpvar_21 = max (((1.055 * 
    pow (max (res_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_17 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_21);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec4 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  tmpvar_12.w = tmpvar_5.x;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  tmpvar_13.w = tmpvar_5.y;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  tmpvar_14.w = tmpvar_5.z;
  mediump vec3 normal_15;
  normal_15 = tmpvar_7;
  mediump vec4 tmpvar_16;
  tmpvar_16.w = 1.0;
  tmpvar_16.xyz = normal_15;
  mediump vec3 res_17;
  mediump vec3 x_18;
  x_18.x = dot (unity_SHAr, tmpvar_16);
  x_18.y = dot (unity_SHAg, tmpvar_16);
  x_18.z = dot (unity_SHAb, tmpvar_16);
  mediump vec3 x1_19;
  mediump vec4 tmpvar_20;
  tmpvar_20 = (normal_15.xyzz * normal_15.yzzx);
  x1_19.x = dot (unity_SHBr, tmpvar_20);
  x1_19.y = dot (unity_SHBg, tmpvar_20);
  x1_19.z = dot (unity_SHBb, tmpvar_20);
  res_17 = (x_18 + (x1_19 + (unity_SHC.xyz * 
    ((normal_15.x * normal_15.x) - (normal_15.y * normal_15.y))
  )));
  mediump vec3 tmpvar_21;
  tmpvar_21 = max (((1.055 * 
    pow (max (res_17, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_17 = tmpvar_21;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_21);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_4 = col_21;
  mediump vec3 normal_30;
  normal_30 = tmpvar_8;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normal_30;
  mediump vec3 res_33;
  mediump vec3 x_34;
  x_34.x = dot (unity_SHAr, tmpvar_32);
  x_34.y = dot (unity_SHAg, tmpvar_32);
  x_34.z = dot (unity_SHAb, tmpvar_32);
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normal_30.xyzz * normal_30.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  res_33 = (x_34 + (x1_35 + (unity_SHC.xyz * 
    ((normal_30.x * normal_30.x) - (normal_30.y * normal_30.y))
  )));
  mediump vec3 tmpvar_37;
  tmpvar_37 = max (((1.055 * 
    pow (max (res_33, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_33 = tmpvar_37;
  ambient_31 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_37));
  tmpvar_4 = ambient_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = ambient_31;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_4 = col_21;
  mediump vec3 normal_30;
  normal_30 = tmpvar_8;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normal_30;
  mediump vec3 res_33;
  mediump vec3 x_34;
  x_34.x = dot (unity_SHAr, tmpvar_32);
  x_34.y = dot (unity_SHAg, tmpvar_32);
  x_34.z = dot (unity_SHAb, tmpvar_32);
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normal_30.xyzz * normal_30.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  res_33 = (x_34 + (x1_35 + (unity_SHC.xyz * 
    ((normal_30.x * normal_30.x) - (normal_30.y * normal_30.y))
  )));
  mediump vec3 tmpvar_37;
  tmpvar_37 = max (((1.055 * 
    pow (max (res_33, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_33 = tmpvar_37;
  ambient_31 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_37));
  tmpvar_4 = ambient_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = ambient_31;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  highp vec3 lightColor0_16;
  lightColor0_16 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_17;
  lightColor1_17 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_18;
  lightColor2_18 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_19;
  lightColor3_19 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_20;
  lightAttenSq_20 = unity_4LightAtten0;
  highp vec3 col_21;
  highp vec4 ndotl_22;
  highp vec4 lengthSq_23;
  highp vec4 tmpvar_24;
  tmpvar_24 = (unity_4LightPosX0 - tmpvar_6.x);
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosY0 - tmpvar_6.y);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosZ0 - tmpvar_6.z);
  lengthSq_23 = (tmpvar_24 * tmpvar_24);
  lengthSq_23 = (lengthSq_23 + (tmpvar_25 * tmpvar_25));
  lengthSq_23 = (lengthSq_23 + (tmpvar_26 * tmpvar_26));
  highp vec4 tmpvar_27;
  tmpvar_27 = max (lengthSq_23, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_23 = tmpvar_27;
  ndotl_22 = (tmpvar_24 * tmpvar_8.x);
  ndotl_22 = (ndotl_22 + (tmpvar_25 * tmpvar_8.y));
  ndotl_22 = (ndotl_22 + (tmpvar_26 * tmpvar_8.z));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_22 * inversesqrt(tmpvar_27)));
  ndotl_22 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29 = (tmpvar_28 * (1.0/((1.0 + 
    (tmpvar_27 * lightAttenSq_20)
  ))));
  col_21 = (lightColor0_16 * tmpvar_29.x);
  col_21 = (col_21 + (lightColor1_17 * tmpvar_29.y));
  col_21 = (col_21 + (lightColor2_18 * tmpvar_29.z));
  col_21 = (col_21 + (lightColor3_19 * tmpvar_29.w));
  tmpvar_4 = col_21;
  mediump vec3 normal_30;
  normal_30 = tmpvar_8;
  mediump vec3 ambient_31;
  mediump vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = normal_30;
  mediump vec3 res_33;
  mediump vec3 x_34;
  x_34.x = dot (unity_SHAr, tmpvar_32);
  x_34.y = dot (unity_SHAg, tmpvar_32);
  x_34.z = dot (unity_SHAb, tmpvar_32);
  mediump vec3 x1_35;
  mediump vec4 tmpvar_36;
  tmpvar_36 = (normal_30.xyzz * normal_30.yzzx);
  x1_35.x = dot (unity_SHBr, tmpvar_36);
  x1_35.y = dot (unity_SHBg, tmpvar_36);
  x1_35.z = dot (unity_SHBb, tmpvar_36);
  res_33 = (x_34 + (x1_35 + (unity_SHC.xyz * 
    ((normal_30.x * normal_30.x) - (normal_30.y * normal_30.y))
  )));
  mediump vec3 tmpvar_37;
  tmpvar_37 = max (((1.055 * 
    pow (max (res_33, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_33 = tmpvar_37;
  ambient_31 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_37));
  tmpvar_4 = ambient_31;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = ambient_31;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  c_1.xyz = _Color.xyz;
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
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
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_WorldToObject[0].xyz;
  tmpvar_7[1] = unity_WorldToObject[1].xyz;
  tmpvar_7[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((_glesNormal * tmpvar_7));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_9[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_9[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((tmpvar_9 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (((tmpvar_8.yzx * worldTangent_3.zxy) - (tmpvar_8.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13.x = worldTangent_3.x;
  tmpvar_13.y = worldBinormal_1.x;
  tmpvar_13.z = tmpvar_8.x;
  tmpvar_13.w = tmpvar_6.x;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.y;
  tmpvar_14.y = worldBinormal_1.y;
  tmpvar_14.z = tmpvar_8.y;
  tmpvar_14.w = tmpvar_6.y;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.z;
  tmpvar_15.y = worldBinormal_1.z;
  tmpvar_15.z = tmpvar_8.z;
  tmpvar_15.w = tmpvar_6.z;
  mediump vec3 normal_16;
  normal_16 = tmpvar_8;
  mediump vec4 tmpvar_17;
  tmpvar_17.w = 1.0;
  tmpvar_17.xyz = normal_16;
  mediump vec3 res_18;
  mediump vec3 x_19;
  x_19.x = dot (unity_SHAr, tmpvar_17);
  x_19.y = dot (unity_SHAg, tmpvar_17);
  x_19.z = dot (unity_SHAb, tmpvar_17);
  mediump vec3 x1_20;
  mediump vec4 tmpvar_21;
  tmpvar_21 = (normal_16.xyzz * normal_16.yzzx);
  x1_20.x = dot (unity_SHBr, tmpvar_21);
  x1_20.y = dot (unity_SHBg, tmpvar_21);
  x1_20.z = dot (unity_SHBb, tmpvar_21);
  res_18 = (x_19 + (x1_20 + (unity_SHC.xyz * 
    ((normal_16.x * normal_16.x) - (normal_16.y * normal_16.y))
  )));
  mediump vec3 tmpvar_22;
  tmpvar_22 = max (((1.055 * 
    pow (max (res_18, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_18 = tmpvar_22;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_13;
  xlv_TEXCOORD2 = tmpvar_14;
  xlv_TEXCOORD3 = tmpvar_15;
  xlv_TEXCOORD4 = max (vec3(0.0, 0.0, 0.0), tmpvar_22);
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  tmpvar_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_4 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_4 = ambient_32;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_4 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_4 = ambient_32;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "FOG_LINEAR" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  mediump vec3 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.xyz = _glesVertex.xyz;
  tmpvar_5 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_6));
  highp vec3 tmpvar_7;
  tmpvar_7 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((_glesNormal * tmpvar_8));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_10[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_10[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize((tmpvar_10 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = (((tmpvar_9.yzx * worldTangent_3.zxy) - (tmpvar_9.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_13;
  highp vec4 tmpvar_14;
  tmpvar_14.x = worldTangent_3.x;
  tmpvar_14.y = worldBinormal_1.x;
  tmpvar_14.z = tmpvar_9.x;
  tmpvar_14.w = tmpvar_7.x;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.y;
  tmpvar_15.y = worldBinormal_1.y;
  tmpvar_15.z = tmpvar_9.y;
  tmpvar_15.w = tmpvar_7.y;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.z;
  tmpvar_16.y = worldBinormal_1.z;
  tmpvar_16.z = tmpvar_9.z;
  tmpvar_16.w = tmpvar_7.z;
  highp vec3 lightColor0_17;
  lightColor0_17 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_18;
  lightColor1_18 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_19;
  lightColor2_19 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_20;
  lightColor3_20 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_21;
  lightAttenSq_21 = unity_4LightAtten0;
  highp vec3 col_22;
  highp vec4 ndotl_23;
  highp vec4 lengthSq_24;
  highp vec4 tmpvar_25;
  tmpvar_25 = (unity_4LightPosX0 - tmpvar_7.x);
  highp vec4 tmpvar_26;
  tmpvar_26 = (unity_4LightPosY0 - tmpvar_7.y);
  highp vec4 tmpvar_27;
  tmpvar_27 = (unity_4LightPosZ0 - tmpvar_7.z);
  lengthSq_24 = (tmpvar_25 * tmpvar_25);
  lengthSq_24 = (lengthSq_24 + (tmpvar_26 * tmpvar_26));
  lengthSq_24 = (lengthSq_24 + (tmpvar_27 * tmpvar_27));
  highp vec4 tmpvar_28;
  tmpvar_28 = max (lengthSq_24, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_24 = tmpvar_28;
  ndotl_23 = (tmpvar_25 * tmpvar_9.x);
  ndotl_23 = (ndotl_23 + (tmpvar_26 * tmpvar_9.y));
  ndotl_23 = (ndotl_23 + (tmpvar_27 * tmpvar_9.z));
  highp vec4 tmpvar_29;
  tmpvar_29 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_23 * inversesqrt(tmpvar_28)));
  ndotl_23 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30 = (tmpvar_29 * (1.0/((1.0 + 
    (tmpvar_28 * lightAttenSq_21)
  ))));
  col_22 = (lightColor0_17 * tmpvar_30.x);
  col_22 = (col_22 + (lightColor1_18 * tmpvar_30.y));
  col_22 = (col_22 + (lightColor2_19 * tmpvar_30.z));
  col_22 = (col_22 + (lightColor3_20 * tmpvar_30.w));
  tmpvar_4 = col_22;
  mediump vec3 normal_31;
  normal_31 = tmpvar_9;
  mediump vec3 ambient_32;
  mediump vec4 tmpvar_33;
  tmpvar_33.w = 1.0;
  tmpvar_33.xyz = normal_31;
  mediump vec3 res_34;
  mediump vec3 x_35;
  x_35.x = dot (unity_SHAr, tmpvar_33);
  x_35.y = dot (unity_SHAg, tmpvar_33);
  x_35.z = dot (unity_SHAb, tmpvar_33);
  mediump vec3 x1_36;
  mediump vec4 tmpvar_37;
  tmpvar_37 = (normal_31.xyzz * normal_31.yzzx);
  x1_36.x = dot (unity_SHBr, tmpvar_37);
  x1_36.y = dot (unity_SHBg, tmpvar_37);
  x1_36.z = dot (unity_SHBb, tmpvar_37);
  res_34 = (x_35 + (x1_36 + (unity_SHC.xyz * 
    ((normal_31.x * normal_31.x) - (normal_31.y * normal_31.y))
  )));
  mediump vec3 tmpvar_38;
  tmpvar_38 = max (((1.055 * 
    pow (max (res_34, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_34 = tmpvar_38;
  ambient_32 = (tmpvar_4 + max (vec3(0.0, 0.0, 0.0), tmpvar_38));
  tmpvar_4 = ambient_32;
  gl_Position = tmpvar_5;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_14;
  xlv_TEXCOORD2 = tmpvar_15;
  xlv_TEXCOORD3 = tmpvar_16;
  xlv_TEXCOORD4 = ambient_32;
  xlv_TEXCOORD5 = ((tmpvar_5.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 unity_FogColor;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2.x = xlv_TEXCOORD1.w;
  tmpvar_2.y = xlv_TEXCOORD2.w;
  tmpvar_2.z = xlv_TEXCOORD3.w;
  highp vec3 tmpvar_3;
  tmpvar_3 = normalize((_WorldSpaceCameraPos - tmpvar_2));
  lowp vec2 texCoords_4;
  lowp float tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = normalize(((
    (xlv_TEXCOORD1.xyz * tmpvar_3.x)
   + 
    (xlv_TEXCOORD2.xyz * tmpvar_3.y)
  ) + (xlv_TEXCOORD3.xyz * tmpvar_3.z))).z;
  tmpvar_5 = (1.0 - tmpvar_6);
  texCoords_4 = xlv_TEXCOORD0;
  texCoords_4 = (texCoords_4 * vec2(_Tile));
  lowp vec4 c_7;
  lowp vec4 c_8;
  c_8.xyz = vec3(0.0, 0.0, 0.0);
  c_8.w = (((
    (texture2D (_Texture, texCoords_4).x * _Strength)
   * 
    pow (tmpvar_5, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_5))
  , _Inside, 1.0)) * _Color.w);
  c_7.w = c_8.w;
  c_7.xyz = c_8.xyz;
  c_1.w = c_7.w;
  highp float tmpvar_9;
  tmpvar_9 = clamp (xlv_TEXCOORD5, 0.0, 1.0);
  c_1.xyz = mix (unity_FogColor.xyz, _Color.xyz, vec3(tmpvar_9));
  gl_FragData[0] = c_1;
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
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" }
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTMAP_SHADOW_MIXING" "LIGHTPROBE_SH" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 102031
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  highp mat3 tmpvar_7;
  tmpvar_7[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_7[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_7[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = normalize((tmpvar_7 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_8;
  highp float tmpvar_9;
  tmpvar_9 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (((tmpvar_6.yzx * worldTangent_3.zxy) - (tmpvar_6.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11.x = worldTangent_3.x;
  tmpvar_11.y = worldBinormal_1.x;
  tmpvar_11.z = tmpvar_6.x;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.y;
  tmpvar_12.y = worldBinormal_1.y;
  tmpvar_12.z = tmpvar_6.y;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.z;
  tmpvar_13.y = worldBinormal_1.z;
  tmpvar_13.z = tmpvar_6.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_11;
  xlv_TEXCOORD2 = tmpvar_12;
  xlv_TEXCOORD3 = tmpvar_13;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  highp vec3 tmpvar_1;
  tmpvar_1 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_2;
  lowp float tmpvar_3;
  highp float tmpvar_4;
  tmpvar_4 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_1.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_1.y)
  ) + (xlv_TEXCOORD3 * tmpvar_1.z))).z;
  tmpvar_3 = (1.0 - tmpvar_4);
  texCoords_2 = xlv_TEXCOORD0;
  texCoords_2 = (texCoords_2 * vec2(_Tile));
  lowp vec4 c_5;
  lowp vec4 c_6;
  c_6.xyz = vec3(0.0, 0.0, 0.0);
  c_6.w = (((
    (texture2D (_Texture, texCoords_2).x * _Strength)
   * 
    pow (tmpvar_3, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_3))
  , _Inside, 1.0)) * _Color.w);
  c_5.w = c_6.w;
  c_5.xyz = c_6.xyz;
  gl_FragData[0] = c_5;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 _Texture_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp float xlv_TEXCOORD5;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  highp mat3 tmpvar_6;
  tmpvar_6[0] = unity_WorldToObject[0].xyz;
  tmpvar_6[1] = unity_WorldToObject[1].xyz;
  tmpvar_6[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_7;
  tmpvar_7 = normalize((_glesNormal * tmpvar_6));
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_8[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_8[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize((tmpvar_8 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (((tmpvar_7.yzx * worldTangent_3.zxy) - (tmpvar_7.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = worldTangent_3.x;
  tmpvar_12.y = worldBinormal_1.x;
  tmpvar_12.z = tmpvar_7.x;
  highp vec3 tmpvar_13;
  tmpvar_13.x = worldTangent_3.y;
  tmpvar_13.y = worldBinormal_1.y;
  tmpvar_13.z = tmpvar_7.y;
  highp vec3 tmpvar_14;
  tmpvar_14.x = worldTangent_3.z;
  tmpvar_14.y = worldBinormal_1.z;
  tmpvar_14.z = tmpvar_7.z;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _Texture_ST.xy) + _Texture_ST.zw);
  xlv_TEXCOORD1 = tmpvar_12;
  xlv_TEXCOORD2 = tmpvar_13;
  xlv_TEXCOORD3 = tmpvar_14;
  xlv_TEXCOORD4 = (unity_ObjectToWorld * _glesVertex).xyz;
  xlv_TEXCOORD5 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform lowp vec4 _Color;
uniform lowp float _Inside;
uniform lowp float _Rim;
uniform sampler2D _Texture;
uniform lowp float _Tile;
uniform lowp float _Strength;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 c_1;
  highp vec3 tmpvar_2;
  tmpvar_2 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD4));
  lowp vec2 texCoords_3;
  lowp float tmpvar_4;
  highp float tmpvar_5;
  tmpvar_5 = normalize(((
    (xlv_TEXCOORD1 * tmpvar_2.x)
   + 
    (xlv_TEXCOORD2 * tmpvar_2.y)
  ) + (xlv_TEXCOORD3 * tmpvar_2.z))).z;
  tmpvar_4 = (1.0 - tmpvar_5);
  texCoords_3 = xlv_TEXCOORD0;
  texCoords_3 = (texCoords_3 * vec2(_Tile));
  lowp vec4 c_6;
  lowp vec4 c_7;
  c_7.xyz = vec3(0.0, 0.0, 0.0);
  c_7.w = (((
    (texture2D (_Texture, texCoords_3).x * _Strength)
   * 
    pow (tmpvar_4, _Rim)
  ) * clamp (
    float((1.0 >= tmpvar_4))
  , _Inside, 1.0)) * _Color.w);
  c_6.w = c_7.w;
  c_6.xyz = c_7.xyz;
  c_1.w = c_6.w;
  c_1.xyz = vec3(0.0, 0.0, 0.0);
  gl_FragData[0] = c_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
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
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
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
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
""
}
}
}
 Pass {
  Name "META"
  Tags { "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 195177
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_15;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_17;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = _Color.xyz;
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_4.w = 1.0;
    highp vec3 tmpvar_5;
    tmpvar_5 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_5;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_6;
    if (bool(unity_UseLinearSpace)) {
      emission_6 = tmpvar_2;
    } else {
      emission_6 = (tmpvar_2 * ((tmpvar_2 * 
        ((tmpvar_2 * 0.305306) + 0.6821711)
      ) + 0.01252288));
    };
    mediump vec4 tmpvar_7;
    tmpvar_7.w = 1.0;
    tmpvar_7.xyz = emission_6;
    res_4 = tmpvar_7;
  };
  tmpvar_1 = res_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_15;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_17;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = _Color.xyz;
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_4.w = 1.0;
    highp vec3 tmpvar_5;
    tmpvar_5 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_5;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_6;
    if (bool(unity_UseLinearSpace)) {
      emission_6 = tmpvar_2;
    } else {
      emission_6 = (tmpvar_2 * ((tmpvar_2 * 
        ((tmpvar_2 * 0.305306) + 0.6821711)
      ) + 0.01252288));
    };
    mediump vec4 tmpvar_7;
    tmpvar_7.w = 1.0;
    tmpvar_7.xyz = emission_6;
    res_4 = tmpvar_7;
  };
  tmpvar_1 = res_4;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord2;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform highp vec4 unity_DynamicLightmapST;
uniform bvec4 unity_MetaVertexControl;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 vertex_4;
  vertex_4 = _glesVertex;
  if (unity_MetaVertexControl.x) {
    vertex_4.xy = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
    highp float tmpvar_5;
    if ((_glesVertex.z > 0.0)) {
      tmpvar_5 = 0.0001;
    } else {
      tmpvar_5 = 0.0;
    };
    vertex_4.z = tmpvar_5;
  };
  if (unity_MetaVertexControl.y) {
    vertex_4.xy = ((_glesMultiTexCoord2.xy * unity_DynamicLightmapST.xy) + unity_DynamicLightmapST.zw);
    highp float tmpvar_6;
    if ((vertex_4.z > 0.0)) {
      tmpvar_6 = 0.0001;
    } else {
      tmpvar_6 = 0.0;
    };
    vertex_4.z = tmpvar_6;
  };
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = vertex_4.xyz;
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_ObjectToWorld * _glesVertex).xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize((_glesNormal * tmpvar_9));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_12;
  highp float tmpvar_13;
  tmpvar_13 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = (((tmpvar_10.yzx * worldTangent_3.zxy) - (tmpvar_10.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.x = worldTangent_3.x;
  tmpvar_15.y = worldBinormal_1.x;
  tmpvar_15.z = tmpvar_10.x;
  tmpvar_15.w = tmpvar_8.x;
  highp vec4 tmpvar_16;
  tmpvar_16.x = worldTangent_3.y;
  tmpvar_16.y = worldBinormal_1.y;
  tmpvar_16.z = tmpvar_10.y;
  tmpvar_16.w = tmpvar_8.y;
  highp vec4 tmpvar_17;
  tmpvar_17.x = worldTangent_3.z;
  tmpvar_17.y = worldBinormal_1.z;
  tmpvar_17.z = tmpvar_10.z;
  tmpvar_17.w = tmpvar_8.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_TEXCOORD0 = tmpvar_15;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_17;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 _Color;
uniform bvec4 unity_MetaFragmentControl;
uniform highp float unity_OneOverOutputBoost;
uniform highp float unity_MaxOutputValue;
uniform highp float unity_UseLinearSpace;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec3 tmpvar_2;
  lowp vec3 tmpvar_3;
  tmpvar_3 = _Color.xyz;
  tmpvar_2 = tmpvar_3;
  mediump vec4 res_4;
  res_4 = vec4(0.0, 0.0, 0.0, 0.0);
  if (unity_MetaFragmentControl.x) {
    res_4.w = 1.0;
    highp vec3 tmpvar_5;
    tmpvar_5 = clamp (pow (vec3(0.0, 0.0, 0.0), vec3(clamp (unity_OneOverOutputBoost, 0.0, 1.0))), vec3(0.0, 0.0, 0.0), vec3(unity_MaxOutputValue));
    res_4.xyz = tmpvar_5;
  };
  if (unity_MetaFragmentControl.y) {
    mediump vec3 emission_6;
    if (bool(unity_UseLinearSpace)) {
      emission_6 = tmpvar_2;
    } else {
      emission_6 = (tmpvar_2 * ((tmpvar_2 * 
        ((tmpvar_2 * 0.305306) + 0.6821711)
      ) + 0.01252288));
    };
    mediump vec4 tmpvar_7;
    tmpvar_7.w = 1.0;
    tmpvar_7.xyz = emission_6;
    res_4 = tmpvar_7;
  };
  tmpvar_1 = res_4;
  gl_FragData[0] = tmpvar_1;
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
Fallback "Diffuse"
}