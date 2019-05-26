//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Cubic/Splatmap-NoLM" {
Properties {
_Control ("Texture", 2D) = "white" { }
_Tile ("Tile", 2D) = "black" { }
_Splat3 ("Layer 3 (A)", 2D) = "white" { }
_Splat2 ("Layer 2 (B)", 2D) = "white" { }
_Splat1 ("Layer 1 (G)", 2D) = "white" { }
_Splat0 ("Layer 0 (R)", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry-100" "RenderType" = "Opaque" }
  GpuProgramID 45182
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(normalize((_glesNormal * tmpvar_4)));
  worldNormal_1 = tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_6 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_7 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(normalize((_glesNormal * tmpvar_4)));
  worldNormal_1 = tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_6 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_7 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_4;
  tmpvar_4[0] = unity_WorldToObject[0].xyz;
  tmpvar_4[1] = unity_WorldToObject[1].xyz;
  tmpvar_4[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_5;
  tmpvar_5 = normalize(normalize((_glesNormal * tmpvar_4)));
  worldNormal_1 = tmpvar_5;
  mediump float tmpvar_6;
  tmpvar_6 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_6 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_7 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_3;
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_3;
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_2 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD3 = ((tmpvar_3.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_3;
  xlv_COLOR1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize(normalize((_glesNormal * tmpvar_5)));
  worldNormal_1 = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_7 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_8 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
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
  tmpvar_7 = normalize(normalize((_glesNormal * tmpvar_6)));
  worldNormal_1 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_9;
  tmpvar_9 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_8 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_9 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD3 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_4;
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
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
  tmpvar_7 = normalize(normalize((_glesNormal * tmpvar_6)));
  worldNormal_1 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_9;
  tmpvar_9 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_8 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_9 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD3 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_4;
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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
uniform highp vec4 _Splat0_ST;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD0_1;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  mediump vec3 worldNormal_1;
  highp vec2 tmpvar_2;
  highp vec4 tmpvar_3;
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
  tmpvar_7 = normalize(normalize((_glesNormal * tmpvar_6)));
  worldNormal_1 = tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = max (0.3, dot (worldNormal_1, vec3(-0.2, 0.8, 0.8)));
  mediump float tmpvar_9;
  tmpvar_9 = max (0.3, worldNormal_1.x);
  tmpvar_3 = ((tmpvar_8 * vec4(0.8, 0.8, 1.0, 1.0)) + (tmpvar_9 * vec4(0.4, 0.4, 0.0, 0.0)));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD0_1 = tmpvar_2;
  xlv_TEXCOORD3 = ((tmpvar_4.z * unity_FogParams.z) + unity_FogParams.w);
  xlv_TEXCOORD2 = ((_glesMultiTexCoord0.xy * _Splat0_ST.xy) + _Splat0_ST.zw);
  gl_Position = tmpvar_4;
  xlv_COLOR1 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _Control;
uniform sampler2D _Splat0;
uniform sampler2D _Splat1;
uniform sampler2D _Splat2;
uniform sampler2D _Splat3;
uniform sampler2D _Tile;
varying highp vec2 xlv_TEXCOORD0;
varying highp float xlv_TEXCOORD3;
varying highp vec2 xlv_TEXCOORD2;
varying highp vec4 xlv_COLOR1;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_Control, xlv_TEXCOORD0);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_Splat3, xlv_TEXCOORD2);
  col_1.xyz = (tmpvar_2.x * texture2D (_Splat0, xlv_TEXCOORD2).xyz);
  col_1.xyz = (col_1.xyz + ((tmpvar_2.y * texture2D (_Splat1, xlv_TEXCOORD2).xyz) * mix (
    dot (tmpvar_3.xyz, vec3(0.5, 0.5, 0.5))
  , 1.0, tmpvar_2.y)));
  col_1.xyz = (col_1.xyz + (tmpvar_2.z * texture2D (_Splat2, xlv_TEXCOORD2).xyz));
  col_1.xyz = (col_1.xyz + (tmpvar_2.w * tmpvar_3.xyz));
  col_1.w = 1.0;
  col_1.xyz = (col_1.xyz + (texture2D (_Tile, xlv_TEXCOORD2).x * 0.5));
  col_1 = (col_1 * xlv_COLOR1);
  highp float tmpvar_4;
  tmpvar_4 = clamp (xlv_TEXCOORD3, 0.0, 1.0);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(tmpvar_4));
  gl_FragData[0] = col_1;
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