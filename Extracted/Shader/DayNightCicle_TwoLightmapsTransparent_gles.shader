//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "DayNightCicle/TwoLightmapsTransparent" {
Properties {
_MainTex ("Base (RGB) Gloss (A)", 2D) = "white" { }
_LightMap ("Base (RGB) Gloss (A)", 2D) = "white" { }
_LightMapNight ("Base (RGB) Gloss (A)", 2D) = "white" { }
_Lerp ("Shininess", Range(0, 1)) = 0
_Color ("Color", Color) = (1,1,1,1)
_Brightness ("Brightness", Range(0, 4)) = 0
}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent+1" "RenderType" = "Transparent" }
  GpuProgramID 36807
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform lowp vec4 _LightColor0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float nl_1;
  mediump vec3 worldNormal_2;
  lowp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_2 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (0.0, dot (worldNormal_2, _WorldSpaceLightPos0.xyz));
  nl_1 = tmpvar_7;
  tmpvar_3 = (nl_1 * _LightColor0);
  mediump vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = worldNormal_2;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_8);
  x_10.y = dot (unity_SHAg, tmpvar_8);
  x_10.z = dot (unity_SHAb, tmpvar_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (worldNormal_2.xyzz * worldNormal_2.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((worldNormal_2.x * worldNormal_2.x) - (worldNormal_2.y * worldNormal_2.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  tmpvar_3.xyz = (tmpvar_3.xyz + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR0 = tmpvar_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _LightMap;
uniform sampler2D _LightMapNight;
uniform highp float _Brightness;
uniform highp float _Lerp;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_2.w = tmpvar_3.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_LightMap, xlv_TEXCOORD1);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (unity_Lightmap_HDR.x * tmpvar_4.xyz);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightMapNight, xlv_TEXCOORD1);
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * tmpvar_6.xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (tmpvar_5, tmpvar_7, vec3(_Lerp));
  lm_1 = tmpvar_8;
  c_2.xyz = ((tmpvar_3.xyz * lm_1) * (_Brightness * xlv_COLOR0.xyz));
  if ((tmpvar_3.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = c_2;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform lowp vec4 _LightColor0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float nl_1;
  mediump vec3 worldNormal_2;
  lowp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_2 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (0.0, dot (worldNormal_2, _WorldSpaceLightPos0.xyz));
  nl_1 = tmpvar_7;
  tmpvar_3 = (nl_1 * _LightColor0);
  mediump vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = worldNormal_2;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_8);
  x_10.y = dot (unity_SHAg, tmpvar_8);
  x_10.z = dot (unity_SHAb, tmpvar_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (worldNormal_2.xyzz * worldNormal_2.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((worldNormal_2.x * worldNormal_2.x) - (worldNormal_2.y * worldNormal_2.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  tmpvar_3.xyz = (tmpvar_3.xyz + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR0 = tmpvar_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _LightMap;
uniform sampler2D _LightMapNight;
uniform highp float _Brightness;
uniform highp float _Lerp;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_2.w = tmpvar_3.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_LightMap, xlv_TEXCOORD1);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (unity_Lightmap_HDR.x * tmpvar_4.xyz);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightMapNight, xlv_TEXCOORD1);
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * tmpvar_6.xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (tmpvar_5, tmpvar_7, vec3(_Lerp));
  lm_1 = tmpvar_8;
  c_2.xyz = ((tmpvar_3.xyz * lm_1) * (_Brightness * xlv_COLOR0.xyz));
  if ((tmpvar_3.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = c_2;
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
attribute vec4 _glesMultiTexCoord1;
uniform highp vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_LightmapST;
uniform lowp vec4 _LightColor0;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float nl_1;
  mediump vec3 worldNormal_2;
  lowp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = _glesVertex.xyz;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = unity_WorldToObject[0].xyz;
  tmpvar_5[1] = unity_WorldToObject[1].xyz;
  tmpvar_5[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_6;
  tmpvar_6 = normalize((_glesNormal * tmpvar_5));
  worldNormal_2 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = max (0.0, dot (worldNormal_2, _WorldSpaceLightPos0.xyz));
  nl_1 = tmpvar_7;
  tmpvar_3 = (nl_1 * _LightColor0);
  mediump vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = worldNormal_2;
  mediump vec3 res_9;
  mediump vec3 x_10;
  x_10.x = dot (unity_SHAr, tmpvar_8);
  x_10.y = dot (unity_SHAg, tmpvar_8);
  x_10.z = dot (unity_SHAb, tmpvar_8);
  mediump vec3 x1_11;
  mediump vec4 tmpvar_12;
  tmpvar_12 = (worldNormal_2.xyzz * worldNormal_2.yzzx);
  x1_11.x = dot (unity_SHBr, tmpvar_12);
  x1_11.y = dot (unity_SHBg, tmpvar_12);
  x1_11.z = dot (unity_SHBb, tmpvar_12);
  res_9 = (x_10 + (x1_11 + (unity_SHC.xyz * 
    ((worldNormal_2.x * worldNormal_2.x) - (worldNormal_2.y * worldNormal_2.y))
  )));
  mediump vec3 tmpvar_13;
  tmpvar_13 = max (((1.055 * 
    pow (max (res_9, vec3(0.0, 0.0, 0.0)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  res_9 = tmpvar_13;
  tmpvar_3.xyz = (tmpvar_3.xyz + tmpvar_13);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR0 = tmpvar_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}


#endif
#ifdef FRAGMENT
uniform mediump vec4 unity_Lightmap_HDR;
uniform sampler2D _MainTex;
uniform sampler2D _LightMap;
uniform sampler2D _LightMapNight;
uniform highp float _Brightness;
uniform highp float _Lerp;
uniform lowp vec4 _Color;
varying highp vec2 xlv_TEXCOORD0;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec3 lm_1;
  lowp vec4 c_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = (texture2D (_MainTex, xlv_TEXCOORD0) * _Color);
  c_2.w = tmpvar_3.w;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_LightMap, xlv_TEXCOORD1);
  mediump vec3 tmpvar_5;
  tmpvar_5 = (unity_Lightmap_HDR.x * tmpvar_4.xyz);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_LightMapNight, xlv_TEXCOORD1);
  mediump vec3 tmpvar_7;
  tmpvar_7 = (unity_Lightmap_HDR.x * tmpvar_6.xyz);
  highp vec3 tmpvar_8;
  tmpvar_8 = mix (tmpvar_5, tmpvar_7, vec3(_Lerp));
  lm_1 = tmpvar_8;
  c_2.xyz = ((tmpvar_3.xyz * lm_1) * (_Brightness * xlv_COLOR0.xyz));
  if ((tmpvar_3.w < 0.5)) {
    discard;
  };
  gl_FragData[0] = c_2;
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