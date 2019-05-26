//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/Splatmap-NoLM-Triplanar" {
Properties {
_Control ("Texture", 2D) = "white" { }
_Splat3 ("Layer 3 (A)", 2D) = "white" { }
_Splat2 ("Layer 2 (B)", 2D) = "white" { }
_Splat1 ("Layer 1 (G)", 2D) = "white" { }
_Splat0 ("Layer 0 (R)", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-100" "RenderType" = "Opaque" }
  GpuProgramID 22920
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(normalize((_glesNormal * tmpvar_8)));
  worldNormal_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_11 = tmpvar_12;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_13 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_14 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_11;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(normalize((_glesNormal * tmpvar_8)));
  worldNormal_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_11 = tmpvar_12;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_13 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_14 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_11;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = unity_WorldToObject[0].xyz;
  tmpvar_8[1] = unity_WorldToObject[1].xyz;
  tmpvar_8[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_9;
  tmpvar_9 = normalize(normalize((_glesNormal * tmpvar_8)));
  worldNormal_2 = tmpvar_9;
  highp vec3 tmpvar_10;
  tmpvar_10 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_10;
  highp vec3 tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_11 = tmpvar_12;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_13;
  tmpvar_13 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_13 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_14 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_11;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = tmpvar_7;
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = tmpvar_7;
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform highp vec4 unity_LightmapST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  tmpvar_7 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_4 = worldPose_1.zy;
  tmpvar_5 = worldPose_1.xy;
  tmpvar_3 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_6 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_7.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_3;
  xlv_TEXCOORD4 = tmpvar_4;
  xlv_TEXCOORD5 = tmpvar_5;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = tmpvar_7;
  xlv_COLOR1 = tmpvar_6;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
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
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_9;
  tmpvar_9[0] = unity_WorldToObject[0].xyz;
  tmpvar_9[1] = unity_WorldToObject[1].xyz;
  tmpvar_9[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_10;
  tmpvar_10 = normalize(normalize((_glesNormal * tmpvar_9)));
  worldNormal_2 = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_11;
  highp vec3 tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_12 = tmpvar_13;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_14;
  tmpvar_14 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_14 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_15 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_12;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_8));
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_16;
  tmpvar_16 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_15 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_16 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD3 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_13;
  gl_Position = tmpvar_8;
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_16;
  tmpvar_16 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_15 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_16 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD3 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_13;
  gl_Position = tmpvar_8;
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldPose_1;
  mediump vec3 worldNormal_2;
  highp vec2 tmpvar_3;
  highp vec2 tmpvar_4;
  highp vec2 tmpvar_5;
  highp vec2 tmpvar_6;
  highp vec4 tmpvar_7;
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = _glesVertex.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp mat3 tmpvar_10;
  tmpvar_10[0] = unity_WorldToObject[0].xyz;
  tmpvar_10[1] = unity_WorldToObject[1].xyz;
  tmpvar_10[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_11;
  tmpvar_11 = normalize(normalize((_glesNormal * tmpvar_10)));
  worldNormal_2 = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPose_1 = tmpvar_12;
  highp vec3 tmpvar_13;
  mediump vec3 tmpvar_14;
  tmpvar_14 = clamp (pow ((worldNormal_2 * 1.4), vec3(4.0, 4.0, 4.0)), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  tmpvar_5 = worldPose_1.zy;
  tmpvar_6 = worldPose_1.xy;
  tmpvar_4 = worldPose_1.xz;
  mediump float tmpvar_15;
  tmpvar_15 = max (0.3, dot (worldNormal_2, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_16;
  tmpvar_16 = max (0.3, worldNormal_2.x);
  tmpvar_7 = ((tmpvar_15 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_16 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_3;
  xlv_TEXCOORD3 = ((tmpvar_8.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD4 = tmpvar_5;
  xlv_TEXCOORD5 = tmpvar_6;
  xlv_TEXCOORD6 = tmpvar_13;
  gl_Position = tmpvar_8;
  xlv_COLOR1 = tmpvar_7;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec2 xlv_TEXCOORD4;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec3 y_1;
  lowp vec3 z_2;
  lowp vec4 col_3;
  mediump vec2 uv_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_Control, xlv_TEXCOORD0);
  highp vec2 tmpvar_6;
  tmpvar_6 = fract(xlv_TEXCOORD2);
  uv_4 = tmpvar_6;
  col_3.xyz = (tmpvar_5.x * texture2D (_Splat0, uv_4).xyz);
  col_3.xyz = (col_3.xyz + ((tmpvar_5.y * texture2D (_Splat1, uv_4).xyz) * mix (
    dot (texture2D (_Splat3, xlv_TEXCOORD2).xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_5.y)));
  col_3.xyz = (col_3.xyz + (tmpvar_5.z * texture2D (_Splat2, uv_4).xyz));
  col_3.xyz = (col_3.xyz + (tmpvar_5.w * texture2D (_Splat3, uv_4).xyz));
  col_3.w = 1.0;
  highp vec2 tmpvar_7;
  tmpvar_7 = fract(xlv_TEXCOORD4);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_Splat2, tmpvar_7);
  highp vec2 tmpvar_9;
  tmpvar_9 = fract(xlv_TEXCOORD5);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_Splat2, tmpvar_9);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_Splat2, uv_4);
  highp vec3 tmpvar_12;
  tmpvar_12 = mix (tmpvar_10.xyz, tmpvar_8.xyz, xlv_TEXCOORD6.xxx);
  z_2 = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = mix (z_2, tmpvar_11.xyz, xlv_TEXCOORD6.yyy);
  y_1 = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = mix (y_1, col_3.xyz, vec3(pow (xlv_TEXCOORD6.y, 4.0)));
  col_3.xyz = tmpvar_14;
  col_3 = (col_3 * xlv_COLOR1);
  highp float tmpvar_15;
  tmpvar_15 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_3.xyz = mix (unity_FogColor.xyz, col_3.xyz, vec3(tmpvar_15));
  gl_FragData[0] = col_3;
}


#endif
"
}
}
Program "fp" {
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
SubProgram "gles hw_tier00 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "LIGHTMAP_ON" "FOG_LINEAR" }
""
}
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
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "LIGHTMAP_OFF" }
""
}
}
}
}
}