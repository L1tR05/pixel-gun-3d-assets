//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  ZWrite Off
  GpuProgramID 25932
Program "vp" {
SubProgram "gles " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _LightAsQuad;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((unity_MatrixV * (unity_ObjectToWorld * tmpvar_8)).xyz * vec3(-1.0, -1.0, 1.0));
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (tmpvar_2, _glesNormal, vec3(_LightAsQuad));
  tmpvar_2 = tmpvar_9;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = o_5;
  xlv_TEXCOORD1 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform lowp samplerCube unity_SpecCube0;
uniform highp vec4 unity_SpecCube0_BoxMax;
uniform highp vec4 unity_SpecCube0_BoxMin;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform highp vec4 unity_SpecCube1_ProbePosition;
uniform highp sampler2D _CameraDepthTexture;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  mediump vec4 gbuffer2_3;
  mediump vec4 gbuffer1_4;
  mediump vec4 gbuffer0_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_6).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_CameraToWorld * tmpvar_7).xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_CameraGBufferTexture0, tmpvar_6);
  gbuffer0_5 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture1, tmpvar_6);
  gbuffer1_4 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_CameraGBufferTexture2, tmpvar_6);
  gbuffer2_3 = tmpvar_11;
  mediump float tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = gbuffer1_4.w;
  mediump vec3 tmpvar_14;
  tmpvar_14 = normalize(((gbuffer2_3.xyz * 2.0) - 1.0));
  tmpvar_13 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_8 - _WorldSpaceCameraPos));
  tmpvar_1 = -(tmpvar_15);
  tmpvar_2 = unity_SpecCube0_HDR;
  mediump vec3 Normal_16;
  Normal_16 = tmpvar_13;
  mediump float tmpvar_17;
  highp float tmpvar_18;
  highp float smoothness_19;
  smoothness_19 = tmpvar_12;
  tmpvar_18 = (1.0 - smoothness_19);
  tmpvar_17 = tmpvar_18;
  mediump vec3 I_20;
  I_20 = -(tmpvar_1);
  mediump vec4 hdr_21;
  hdr_21 = tmpvar_2;
  mediump vec4 tmpvar_22;
  tmpvar_22.xyz = (I_20 - (2.0 * (
    dot (Normal_16, I_20)
   * Normal_16)));
  tmpvar_22.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_23;
  tmpvar_23 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_22.xyz, tmpvar_22.w);
  mediump vec4 tmpvar_24;
  tmpvar_24 = tmpvar_23;
  highp vec3 viewDir_25;
  viewDir_25 = -(tmpvar_15);
  mediump vec2 rlPow4AndFresnelTerm_26;
  mediump float tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = clamp (dot (tmpvar_13, viewDir_25), 0.0, 1.0);
  tmpvar_27 = tmpvar_28;
  highp vec2 tmpvar_29;
  tmpvar_29.x = (viewDir_25 - (2.0 * (
    dot (tmpvar_13, viewDir_25)
   * tmpvar_13))).y;
  tmpvar_29.y = (1.0 - tmpvar_27);
  highp vec2 tmpvar_30;
  tmpvar_30 = ((tmpvar_29 * tmpvar_29) * (tmpvar_29 * tmpvar_29));
  rlPow4AndFresnelTerm_26 = tmpvar_30;
  mediump vec4 tmpvar_31;
  tmpvar_31.w = 1.0;
  tmpvar_31.xyz = (((
    (hdr_21.x * ((hdr_21.w * (tmpvar_24.w - 1.0)) + 1.0))
   * tmpvar_24.xyz) * gbuffer0_5.w) * mix (gbuffer1_4.xyz, vec3(clamp (
    (gbuffer1_4.w + (1.0 - (1.0 - max (
      max (gbuffer1_4.x, gbuffer1_4.y)
    , gbuffer1_4.z))))
  , 0.0, 1.0)), rlPow4AndFresnelTerm_26.yyy));
  mediump vec3 p_32;
  p_32 = tmpvar_8;
  mediump vec3 aabbMin_33;
  aabbMin_33 = unity_SpecCube0_BoxMin.xyz;
  mediump vec3 aabbMax_34;
  aabbMax_34 = unity_SpecCube0_BoxMax.xyz;
  mediump vec3 tmpvar_35;
  tmpvar_35 = max (max ((p_32 - aabbMax_34), (aabbMin_33 - p_32)), vec3(0.0, 0.0, 0.0));
  mediump float tmpvar_36;
  tmpvar_36 = sqrt(dot (tmpvar_35, tmpvar_35));
  mediump float tmpvar_37;
  highp float tmpvar_38;
  tmpvar_38 = clamp ((1.0 - (tmpvar_36 / unity_SpecCube1_ProbePosition.w)), 0.0, 1.0);
  tmpvar_37 = tmpvar_38;
  mediump vec4 tmpvar_39;
  tmpvar_39.xyz = tmpvar_31.xyz;
  tmpvar_39.w = tmpvar_37;
  gl_FragData[0] = tmpvar_39;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _LightAsQuad;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((unity_MatrixV * (unity_ObjectToWorld * tmpvar_8)).xyz * vec3(-1.0, -1.0, 1.0));
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (tmpvar_2, _glesNormal, vec3(_LightAsQuad));
  tmpvar_2 = tmpvar_9;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = o_5;
  xlv_TEXCOORD1 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform lowp samplerCube unity_SpecCube0;
uniform highp vec4 unity_SpecCube0_BoxMax;
uniform highp vec4 unity_SpecCube0_BoxMin;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform highp vec4 unity_SpecCube1_ProbePosition;
uniform highp sampler2D _CameraDepthTexture;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  mediump vec4 gbuffer2_3;
  mediump vec4 gbuffer1_4;
  mediump vec4 gbuffer0_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_6).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_CameraToWorld * tmpvar_7).xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_CameraGBufferTexture0, tmpvar_6);
  gbuffer0_5 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture1, tmpvar_6);
  gbuffer1_4 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_CameraGBufferTexture2, tmpvar_6);
  gbuffer2_3 = tmpvar_11;
  mediump float tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = gbuffer1_4.w;
  mediump vec3 tmpvar_14;
  tmpvar_14 = normalize(((gbuffer2_3.xyz * 2.0) - 1.0));
  tmpvar_13 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_8 - _WorldSpaceCameraPos));
  tmpvar_1 = -(tmpvar_15);
  tmpvar_2 = unity_SpecCube0_HDR;
  mediump vec3 Normal_16;
  Normal_16 = tmpvar_13;
  mediump float tmpvar_17;
  highp float tmpvar_18;
  highp float smoothness_19;
  smoothness_19 = tmpvar_12;
  tmpvar_18 = (1.0 - smoothness_19);
  tmpvar_17 = tmpvar_18;
  mediump vec3 I_20;
  I_20 = -(tmpvar_1);
  mediump vec3 tmpvar_21;
  mediump vec4 hdr_22;
  hdr_22 = tmpvar_2;
  mediump vec4 tmpvar_23;
  tmpvar_23.xyz = (I_20 - (2.0 * (
    dot (Normal_16, I_20)
   * Normal_16)));
  tmpvar_23.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_24;
  tmpvar_24 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_23.xyz, tmpvar_23.w);
  mediump vec4 tmpvar_25;
  tmpvar_25 = tmpvar_24;
  tmpvar_21 = (((hdr_22.x * 
    ((hdr_22.w * (tmpvar_25.w - 1.0)) + 1.0)
  ) * tmpvar_25.xyz) * gbuffer0_5.w);
  mediump vec3 color_26;
  mediump float surfaceReduction_27;
  mediump float roughness_28;
  mediump float perceptualRoughness_29;
  mediump float tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = clamp (dot (tmpvar_13, -(tmpvar_15)), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp float tmpvar_32;
  highp float smoothness_33;
  smoothness_33 = tmpvar_12;
  tmpvar_32 = (1.0 - smoothness_33);
  perceptualRoughness_29 = tmpvar_32;
  highp float tmpvar_34;
  highp float perceptualRoughness_35;
  perceptualRoughness_35 = perceptualRoughness_29;
  tmpvar_34 = (perceptualRoughness_35 * perceptualRoughness_35);
  roughness_28 = tmpvar_34;
  surfaceReduction_27 = (1.0 - ((roughness_28 * perceptualRoughness_29) * 0.28));
  mediump float x_36;
  x_36 = (1.0 - tmpvar_30);
  mediump vec3 tmpvar_37;
  tmpvar_37 = mix (gbuffer1_4.xyz, vec3(clamp ((gbuffer1_4.w + 
    (1.0 - (1.0 - max (max (gbuffer1_4.x, gbuffer1_4.y), gbuffer1_4.z)))
  ), 0.0, 1.0)), vec3(((x_36 * x_36) * (x_36 * x_36))));
  highp vec3 tmpvar_38;
  tmpvar_38 = ((surfaceReduction_27 * tmpvar_21) * tmpvar_37);
  color_26 = tmpvar_38;
  mediump vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = color_26;
  mediump vec3 p_40;
  p_40 = tmpvar_8;
  mediump vec3 aabbMin_41;
  aabbMin_41 = unity_SpecCube0_BoxMin.xyz;
  mediump vec3 aabbMax_42;
  aabbMax_42 = unity_SpecCube0_BoxMax.xyz;
  mediump vec3 tmpvar_43;
  tmpvar_43 = max (max ((p_40 - aabbMax_42), (aabbMin_41 - p_40)), vec3(0.0, 0.0, 0.0));
  mediump float tmpvar_44;
  tmpvar_44 = sqrt(dot (tmpvar_43, tmpvar_43));
  mediump float tmpvar_45;
  highp float tmpvar_46;
  tmpvar_46 = clamp ((1.0 - (tmpvar_44 / unity_SpecCube1_ProbePosition.w)), 0.0, 1.0);
  tmpvar_45 = tmpvar_46;
  mediump vec4 tmpvar_47;
  tmpvar_47.xyz = tmpvar_39.xyz;
  tmpvar_47.w = tmpvar_45;
  gl_FragData[0] = tmpvar_47;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec3 _glesNormal;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
uniform highp float _LightAsQuad;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec3 tmpvar_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  tmpvar_3 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  highp vec4 o_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (tmpvar_3 * 0.5);
  highp vec2 tmpvar_7;
  tmpvar_7.x = tmpvar_6.x;
  tmpvar_7.y = (tmpvar_6.y * _ProjectionParams.x);
  o_5.xy = (tmpvar_7 + tmpvar_6.w);
  o_5.zw = tmpvar_3.zw;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = tmpvar_1.xyz;
  tmpvar_2 = ((unity_MatrixV * (unity_ObjectToWorld * tmpvar_8)).xyz * vec3(-1.0, -1.0, 1.0));
  highp vec3 tmpvar_9;
  tmpvar_9 = mix (tmpvar_2, _glesNormal, vec3(_LightAsQuad));
  tmpvar_2 = tmpvar_9;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = o_5;
  xlv_TEXCOORD1 = tmpvar_9;
}


#endif
#ifdef FRAGMENT
#extension GL_EXT_shader_texture_lod : enable
lowp vec4 impl_low_textureCubeLodEXT(lowp samplerCube sampler, highp vec3 coord, mediump float lod)
{
#if defined(GL_EXT_shader_texture_lod)
	return textureCubeLodEXT(sampler, coord, lod);
#else
	return textureCube(sampler, coord, lod);
#endif
}

uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform highp vec4 _ZBufferParams;
uniform highp mat4 unity_CameraToWorld;
uniform lowp samplerCube unity_SpecCube0;
uniform highp vec4 unity_SpecCube0_BoxMax;
uniform highp vec4 unity_SpecCube0_BoxMin;
uniform mediump vec4 unity_SpecCube0_HDR;
uniform highp vec4 unity_SpecCube1_ProbePosition;
uniform highp sampler2D _CameraDepthTexture;
uniform sampler2D _CameraGBufferTexture0;
uniform sampler2D _CameraGBufferTexture1;
uniform sampler2D _CameraGBufferTexture2;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 tmpvar_1;
  highp vec4 tmpvar_2;
  mediump vec4 gbuffer2_3;
  mediump vec4 gbuffer1_4;
  mediump vec4 gbuffer0_5;
  highp vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0.xy / xlv_TEXCOORD0.w);
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = ((xlv_TEXCOORD1 * (_ProjectionParams.z / xlv_TEXCOORD1.z)) * (1.0/((
    (_ZBufferParams.x * texture2D (_CameraDepthTexture, tmpvar_6).x)
   + _ZBufferParams.y))));
  highp vec3 tmpvar_8;
  tmpvar_8 = (unity_CameraToWorld * tmpvar_7).xyz;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_CameraGBufferTexture0, tmpvar_6);
  gbuffer0_5 = tmpvar_9;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_CameraGBufferTexture1, tmpvar_6);
  gbuffer1_4 = tmpvar_10;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_CameraGBufferTexture2, tmpvar_6);
  gbuffer2_3 = tmpvar_11;
  mediump float tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_12 = gbuffer1_4.w;
  mediump vec3 tmpvar_14;
  tmpvar_14 = normalize(((gbuffer2_3.xyz * 2.0) - 1.0));
  tmpvar_13 = tmpvar_14;
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize((tmpvar_8 - _WorldSpaceCameraPos));
  tmpvar_1 = -(tmpvar_15);
  tmpvar_2 = unity_SpecCube0_HDR;
  mediump vec3 Normal_16;
  Normal_16 = tmpvar_13;
  mediump float tmpvar_17;
  highp float tmpvar_18;
  highp float smoothness_19;
  smoothness_19 = tmpvar_12;
  tmpvar_18 = (1.0 - smoothness_19);
  tmpvar_17 = tmpvar_18;
  mediump vec3 I_20;
  I_20 = -(tmpvar_1);
  mediump vec3 tmpvar_21;
  mediump vec4 hdr_22;
  hdr_22 = tmpvar_2;
  mediump vec4 tmpvar_23;
  tmpvar_23.xyz = (I_20 - (2.0 * (
    dot (Normal_16, I_20)
   * Normal_16)));
  tmpvar_23.w = ((tmpvar_17 * (1.7 - 
    (0.7 * tmpvar_17)
  )) * 6.0);
  lowp vec4 tmpvar_24;
  tmpvar_24 = impl_low_textureCubeLodEXT (unity_SpecCube0, tmpvar_23.xyz, tmpvar_23.w);
  mediump vec4 tmpvar_25;
  tmpvar_25 = tmpvar_24;
  tmpvar_21 = (((hdr_22.x * 
    ((hdr_22.w * (tmpvar_25.w - 1.0)) + 1.0)
  ) * tmpvar_25.xyz) * gbuffer0_5.w);
  mediump vec3 color_26;
  mediump float surfaceReduction_27;
  mediump float roughness_28;
  mediump float perceptualRoughness_29;
  mediump float tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = clamp (dot (tmpvar_13, -(tmpvar_15)), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  highp float tmpvar_32;
  highp float smoothness_33;
  smoothness_33 = tmpvar_12;
  tmpvar_32 = (1.0 - smoothness_33);
  perceptualRoughness_29 = tmpvar_32;
  highp float tmpvar_34;
  highp float perceptualRoughness_35;
  perceptualRoughness_35 = perceptualRoughness_29;
  tmpvar_34 = (perceptualRoughness_35 * perceptualRoughness_35);
  roughness_28 = tmpvar_34;
  surfaceReduction_27 = (1.0 - ((roughness_28 * perceptualRoughness_29) * 0.28));
  mediump float x_36;
  x_36 = (1.0 - tmpvar_30);
  mediump vec3 tmpvar_37;
  tmpvar_37 = mix (gbuffer1_4.xyz, vec3(clamp ((gbuffer1_4.w + 
    (1.0 - (1.0 - max (max (gbuffer1_4.x, gbuffer1_4.y), gbuffer1_4.z)))
  ), 0.0, 1.0)), vec3(((x_36 * x_36) * (x_36 * x_36))));
  highp vec3 tmpvar_38;
  tmpvar_38 = ((surfaceReduction_27 * tmpvar_21) * tmpvar_37);
  color_26 = tmpvar_38;
  mediump vec4 tmpvar_39;
  tmpvar_39.w = 1.0;
  tmpvar_39.xyz = color_26;
  mediump vec3 p_40;
  p_40 = tmpvar_8;
  mediump vec3 aabbMin_41;
  aabbMin_41 = unity_SpecCube0_BoxMin.xyz;
  mediump vec3 aabbMax_42;
  aabbMax_42 = unity_SpecCube0_BoxMax.xyz;
  mediump vec3 tmpvar_43;
  tmpvar_43 = max (max ((p_40 - aabbMax_42), (aabbMin_41 - p_40)), vec3(0.0, 0.0, 0.0));
  mediump float tmpvar_44;
  tmpvar_44 = sqrt(dot (tmpvar_43, tmpvar_43));
  mediump float tmpvar_45;
  highp float tmpvar_46;
  tmpvar_46 = clamp ((1.0 - (tmpvar_44 / unity_SpecCube1_ProbePosition.w)), 0.0, 1.0);
  tmpvar_45 = tmpvar_46;
  mediump vec4 tmpvar_47;
  tmpvar_47.xyz = tmpvar_39.xyz;
  tmpvar_47.w = tmpvar_45;
  gl_FragData[0] = tmpvar_47;
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
 Pass {
  ZTest Always
  ZWrite Off
  GpuProgramID 99526
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = exp2(-(c_1.xyz));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = exp2(-(c_1.xyz));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = exp2(-(c_1.xyz));
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = c_1.xyz;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = c_1.xyz;
  gl_FragData[0] = tmpvar_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 o_3;
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_1 * 0.5);
  highp vec2 tmpvar_5;
  tmpvar_5.x = tmpvar_4.x;
  tmpvar_5.y = (tmpvar_4.y * _ProjectionParams.x);
  o_3.xy = (tmpvar_5 + tmpvar_4.w);
  o_3.zw = tmpvar_1.zw;
  xlv_TEXCOORD0 = o_3.xy;
  gl_Position = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _CameraReflectionsTexture;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 c_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_CameraReflectionsTexture, xlv_TEXCOORD0);
  c_1 = tmpvar_2;
  mediump vec4 tmpvar_3;
  tmpvar_3.w = 0.0;
  tmpvar_3.xyz = c_1.xyz;
  gl_FragData[0] = tmpvar_3;
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
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
""
}
}
}
}
}