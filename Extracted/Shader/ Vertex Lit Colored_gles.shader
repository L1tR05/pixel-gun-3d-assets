//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader " Vertex Lit Colored" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Spec Color", Color) = (1,1,1,1)
_Emission ("Emissive Color", Color) = (0,0,0,0)
_Shininess ("Shininess", Range(0.01, 1)) = 0.01
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "Vertex" }
  GpuProgramID 51595
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_2.xyz;
  tmpvar_14[1] = tmpvar_3.xyz;
  tmpvar_14[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_14 * _glesNormal));
  eyeNormal_11 = tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz);
  viewDir_10 = -(tmpvar_16);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_17;
    tmpvar_17 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_18;
    dirToLight_18 = tmpvar_17;
    mediump vec3 specColor_19;
    specColor_19 = specColor_8;
    mediump float tmpvar_20;
    tmpvar_20 = max (dot (eyeNormal_11, dirToLight_18), 0.0);
    mediump vec3 tmpvar_21;
    tmpvar_21 = ((tmpvar_20 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_20 > 0.0)) {
      specColor_19 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_18 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_19;
    lcolor_9 = (lcolor_9 + min ((tmpvar_21 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_12, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp vec3 tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_COLOR1 = tmpvar_24;
  highp vec2 tmpvar_27;
  tmpvar_27 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_27 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_27 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_2.xyz;
  tmpvar_14[1] = tmpvar_3.xyz;
  tmpvar_14[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_14 * _glesNormal));
  eyeNormal_11 = tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz);
  viewDir_10 = -(tmpvar_16);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_17;
    tmpvar_17 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_18;
    dirToLight_18 = tmpvar_17;
    mediump vec3 specColor_19;
    specColor_19 = specColor_8;
    mediump float tmpvar_20;
    tmpvar_20 = max (dot (eyeNormal_11, dirToLight_18), 0.0);
    mediump vec3 tmpvar_21;
    tmpvar_21 = ((tmpvar_20 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_20 > 0.0)) {
      specColor_19 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_18 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_19;
    lcolor_9 = (lcolor_9 + min ((tmpvar_21 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_12, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp vec3 tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_COLOR1 = tmpvar_24;
  highp vec2 tmpvar_27;
  tmpvar_27 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_27 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_27 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_2.xyz;
  tmpvar_14[1] = tmpvar_3.xyz;
  tmpvar_14[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_14 * _glesNormal));
  eyeNormal_11 = tmpvar_15;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize(((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz);
  viewDir_10 = -(tmpvar_16);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_17;
    tmpvar_17 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_18;
    dirToLight_18 = tmpvar_17;
    mediump vec3 specColor_19;
    specColor_19 = specColor_8;
    mediump float tmpvar_20;
    tmpvar_20 = max (dot (eyeNormal_11, dirToLight_18), 0.0);
    mediump vec3 tmpvar_21;
    tmpvar_21 = ((tmpvar_20 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_20 > 0.0)) {
      specColor_19 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_18 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_19;
    lcolor_9 = (lcolor_9 + min ((tmpvar_21 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_22;
  mediump vec4 tmpvar_23;
  tmpvar_23 = clamp (color_12, 0.0, 1.0);
  tmpvar_22 = tmpvar_23;
  lowp vec3 tmpvar_24;
  mediump vec3 tmpvar_25;
  tmpvar_25 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  highp vec4 tmpvar_26;
  tmpvar_26.w = 1.0;
  tmpvar_26.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_22;
  xlv_COLOR1 = tmpvar_24;
  highp vec2 tmpvar_27;
  tmpvar_27 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_27 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_27 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_26));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_31;
  tmpvar_31 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_31 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_31 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_31;
  tmpvar_31 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_31 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_31 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  highp vec4 tmpvar_30;
  tmpvar_30.w = 1.0;
  tmpvar_30.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_31;
  tmpvar_31 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_31 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_31 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_30));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
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
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz;
  highp mat3 tmpvar_15;
  tmpvar_15[0] = tmpvar_2.xyz;
  tmpvar_15[1] = tmpvar_3.xyz;
  tmpvar_15[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize((tmpvar_15 * _glesNormal));
  eyeNormal_11 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(tmpvar_14);
  viewDir_10 = -(tmpvar_17);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_18;
    tmpvar_18 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_19;
    dirToLight_19 = tmpvar_18;
    mediump vec3 specColor_20;
    specColor_20 = specColor_8;
    mediump float tmpvar_21;
    tmpvar_21 = max (dot (eyeNormal_11, dirToLight_19), 0.0);
    mediump vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_21 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_21 > 0.0)) {
      specColor_20 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_19 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_20;
    lcolor_9 = (lcolor_9 + min ((tmpvar_22 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = clamp (color_12, 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  lowp vec3 tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_25 = tmpvar_26;
  lowp float tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = clamp (((
    sqrt(dot (tmpvar_14, tmpvar_14))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  highp vec2 tmpvar_30;
  tmpvar_30 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
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
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz;
  highp mat3 tmpvar_15;
  tmpvar_15[0] = tmpvar_2.xyz;
  tmpvar_15[1] = tmpvar_3.xyz;
  tmpvar_15[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize((tmpvar_15 * _glesNormal));
  eyeNormal_11 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(tmpvar_14);
  viewDir_10 = -(tmpvar_17);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_18;
    tmpvar_18 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_19;
    dirToLight_19 = tmpvar_18;
    mediump vec3 specColor_20;
    specColor_20 = specColor_8;
    mediump float tmpvar_21;
    tmpvar_21 = max (dot (eyeNormal_11, dirToLight_19), 0.0);
    mediump vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_21 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_21 > 0.0)) {
      specColor_20 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_19 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_20;
    lcolor_9 = (lcolor_9 + min ((tmpvar_22 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = clamp (color_12, 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  lowp vec3 tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_25 = tmpvar_26;
  lowp float tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = clamp (((
    sqrt(dot (tmpvar_14, tmpvar_14))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  highp vec2 tmpvar_30;
  tmpvar_30 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
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
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  mediump vec4 color_12;
  color_12 = _glesColor;
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_5;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_13).xyz;
  highp mat3 tmpvar_15;
  tmpvar_15[0] = tmpvar_2.xyz;
  tmpvar_15[1] = tmpvar_3.xyz;
  tmpvar_15[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize((tmpvar_15 * _glesNormal));
  eyeNormal_11 = tmpvar_16;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize(tmpvar_14);
  viewDir_10 = -(tmpvar_17);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    highp vec3 tmpvar_18;
    tmpvar_18 = unity_LightPosition[il_6].xyz;
    mediump vec3 dirToLight_19;
    dirToLight_19 = tmpvar_18;
    mediump vec3 specColor_20;
    specColor_20 = specColor_8;
    mediump float tmpvar_21;
    tmpvar_21 = max (dot (eyeNormal_11, dirToLight_19), 0.0);
    mediump vec3 tmpvar_22;
    tmpvar_22 = ((tmpvar_21 * color_12.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_21 > 0.0)) {
      specColor_20 = (specColor_8 + ((0.5 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_19 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_20;
    lcolor_9 = (lcolor_9 + min ((tmpvar_22 * 0.5), vec3(1.0, 1.0, 1.0)));
  };
  color_12.xyz = lcolor_9;
  color_12.w = color_12.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = clamp (color_12, 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  lowp vec3 tmpvar_25;
  mediump vec3 tmpvar_26;
  tmpvar_26 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_25 = tmpvar_26;
  lowp float tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = clamp (((
    sqrt(dot (tmpvar_14, tmpvar_14))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec4 tmpvar_29;
  tmpvar_29.w = 1.0;
  tmpvar_29.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  highp vec2 tmpvar_30;
  tmpvar_30 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_30 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_29));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp float tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_30;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp float tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_30;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform mediump vec4 unity_LightColor[8];
uniform highp vec4 unity_LightPosition[8];
uniform mediump vec4 unity_LightAtten[8];
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform lowp vec4 glstate_lightmodel_ambient;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixInvV;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 unity_FogParams;
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float att_19;
    highp vec3 dirToLight_20;
    dirToLight_20 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_21;
    tmpvar_21 = dot (dirToLight_20, dirToLight_20);
    att_19 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_21))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_21 > unity_LightAtten[il_6].w))) {
      att_19 = 0.0;
    };
    dirToLight_20 = (dirToLight_20 * inversesqrt(max (tmpvar_21, 1e-06)));
    att_19 = (att_19 * 0.5);
    mediump vec3 dirToLight_22;
    dirToLight_22 = dirToLight_20;
    mediump vec3 specColor_23;
    specColor_23 = specColor_8;
    mediump float tmpvar_24;
    tmpvar_24 = max (dot (eyeNormal_11, dirToLight_22), 0.0);
    mediump vec3 tmpvar_25;
    tmpvar_25 = ((tmpvar_24 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_24 > 0.0)) {
      specColor_23 = (specColor_8 + ((att_19 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_22 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_23;
    lcolor_9 = (lcolor_9 + min ((tmpvar_25 * att_19), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_26;
  mediump vec4 tmpvar_27;
  tmpvar_27 = clamp (color_13, 0.0, 1.0);
  tmpvar_26 = tmpvar_27;
  lowp vec3 tmpvar_28;
  mediump vec3 tmpvar_29;
  tmpvar_29 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp float tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp vec4 tmpvar_32;
  tmpvar_32.w = 1.0;
  tmpvar_32.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_26;
  xlv_COLOR1 = tmpvar_28;
  highp vec2 tmpvar_33;
  tmpvar_33 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_33 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_30;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_32));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_35;
  tmpvar_35 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_35;
  tmpvar_35 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
  gl_FragData[0] = col_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "FOG_LINEAR" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
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
uniform mediump vec4 _SpecColor;
uniform mediump vec4 _Emission;
uniform mediump float _Shininess;
uniform highp vec4 _MainTex_ST;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying lowp float xlv_TEXCOORD2;
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
  highp vec3 tmpvar_5;
  tmpvar_5 = _glesVertex.xyz;
  mediump float shininess_7;
  mediump vec3 specColor_8;
  mediump vec3 lcolor_9;
  mediump vec3 viewDir_10;
  mediump vec3 eyeNormal_11;
  highp vec3 eyePos_12;
  mediump vec4 color_13;
  color_13 = _glesColor;
  highp vec4 tmpvar_14;
  tmpvar_14.w = 1.0;
  tmpvar_14.xyz = tmpvar_5;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((unity_MatrixV * unity_ObjectToWorld) * tmpvar_14).xyz;
  eyePos_12 = tmpvar_15;
  highp mat3 tmpvar_16;
  tmpvar_16[0] = tmpvar_2.xyz;
  tmpvar_16[1] = tmpvar_3.xyz;
  tmpvar_16[2] = tmpvar_4.xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize((tmpvar_16 * _glesNormal));
  eyeNormal_11 = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize(tmpvar_15);
  viewDir_10 = -(tmpvar_18);
  lcolor_9 = (_Emission.xyz + (_glesColor.xyz * glstate_lightmodel_ambient.xyz));
  specColor_8 = vec3(0.0, 0.0, 0.0);
  shininess_7 = (_Shininess * 128.0);
  for (highp int il_6 = 0; il_6 < 8; il_6++) {
    mediump float rho_19;
    mediump float att_20;
    highp vec3 dirToLight_21;
    dirToLight_21 = (unity_LightPosition[il_6].xyz - (eyePos_12 * unity_LightPosition[il_6].w));
    highp float tmpvar_22;
    tmpvar_22 = dot (dirToLight_21, dirToLight_21);
    att_20 = (1.0/((1.0 + (unity_LightAtten[il_6].z * tmpvar_22))));
    if (((unity_LightPosition[il_6].w != 0.0) && (tmpvar_22 > unity_LightAtten[il_6].w))) {
      att_20 = 0.0;
    };
    dirToLight_21 = (dirToLight_21 * inversesqrt(max (tmpvar_22, 1e-06)));
    highp float tmpvar_23;
    tmpvar_23 = max (dot (dirToLight_21, unity_SpotDirection[il_6].xyz), 0.0);
    rho_19 = tmpvar_23;
    att_20 = (att_20 * clamp ((
      (rho_19 - unity_LightAtten[il_6].x)
     * unity_LightAtten[il_6].y), 0.0, 1.0));
    att_20 = (att_20 * 0.5);
    mediump vec3 dirToLight_24;
    dirToLight_24 = dirToLight_21;
    mediump vec3 specColor_25;
    specColor_25 = specColor_8;
    mediump float tmpvar_26;
    tmpvar_26 = max (dot (eyeNormal_11, dirToLight_24), 0.0);
    mediump vec3 tmpvar_27;
    tmpvar_27 = ((tmpvar_26 * color_13.xyz) * unity_LightColor[il_6].xyz);
    if ((tmpvar_26 > 0.0)) {
      specColor_25 = (specColor_8 + ((att_20 * 
        clamp (pow (max (dot (eyeNormal_11, 
          normalize((dirToLight_24 + viewDir_10))
        ), 0.0), shininess_7), 0.0, 1.0)
      ) * unity_LightColor[il_6].xyz));
    };
    specColor_8 = specColor_25;
    lcolor_9 = (lcolor_9 + min ((tmpvar_27 * att_20), vec3(1.0, 1.0, 1.0)));
  };
  color_13.xyz = lcolor_9;
  color_13.w = color_13.w;
  specColor_8 = (specColor_8 * _SpecColor.xyz);
  lowp vec4 tmpvar_28;
  mediump vec4 tmpvar_29;
  tmpvar_29 = clamp (color_13, 0.0, 1.0);
  tmpvar_28 = tmpvar_29;
  lowp vec3 tmpvar_30;
  mediump vec3 tmpvar_31;
  tmpvar_31 = clamp (specColor_8, 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  lowp float tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = clamp (((
    sqrt(dot (tmpvar_15, tmpvar_15))
   * unity_FogParams.z) + unity_FogParams.w), 0.0, 1.0);
  tmpvar_32 = tmpvar_33;
  highp vec4 tmpvar_34;
  tmpvar_34.w = 1.0;
  tmpvar_34.xyz = tmpvar_5;
  xlv_COLOR0 = tmpvar_28;
  xlv_COLOR1 = tmpvar_30;
  highp vec2 tmpvar_35;
  tmpvar_35 = (_glesMultiTexCoord0.xy * _MainTex_ST.xy);
  xlv_TEXCOORD0 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD1 = (tmpvar_35 + _MainTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_32;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_34));
}


#endif
#ifdef FRAGMENT
uniform lowp vec4 unity_FogColor;
uniform sampler2D _MainTex;
uniform lowp vec4 _Color;
varying lowp vec4 xlv_COLOR0;
varying lowp vec3 xlv_COLOR1;
varying highp vec2 xlv_TEXCOORD0;
varying lowp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 col_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  col_1.xyz = (tmpvar_2 * xlv_COLOR0).xyz;
  col_1.w = (tmpvar_2.w * xlv_COLOR0.w);
  col_1.xyz = (col_1 * _Color).xyz;
  col_1 = (col_1 * 2.0);
  col_1.w = (col_1.w * _Color.w);
  col_1.xyz = (col_1.xyz + xlv_COLOR1);
  col_1.xyz = mix (unity_FogColor.xyz, col_1.xyz, vec3(xlv_TEXCOORD2));
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
}
}
}
Fallback " VertexLit"
}