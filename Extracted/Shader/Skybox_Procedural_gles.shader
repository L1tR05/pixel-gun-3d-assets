//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Skybox/Procedural" {
Properties {
_SunTint ("Sun Tint", Color) = (1,1,1,1)
_SunStrength ("Sun Strength", Float) = 1
_Color ("Atmosphere Tint", Color) = (0.5,0.5,0.5,1)
_GroundColor ("Ground", Color) = (0.369,0.349,0.341,1)
_HdrExposure ("HDR Exposure", Float) = 1.3
}
SubShader {
 Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
  ZWrite Off
  Cull Off
  GpuProgramID 16313
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec3 _Color;
highp vec3 kInvWavelength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump float tmpvar_2;
  tmpvar_2 = pow (_Color.x, 0.454545);
  tmpvar_1.x = (1.0/(((
    ((0.65 * mix (2.0, 0.7, tmpvar_2)) * (0.65 * mix (2.0, 0.7, tmpvar_2)))
   * 
    (0.65 * mix (2.0, 0.7, tmpvar_2))
  ) * (0.65 * 
    mix (2.0, 0.7, tmpvar_2)
  ))));
  mediump float tmpvar_3;
  tmpvar_3 = pow (_Color.y, 0.454545);
  tmpvar_1.y = (1.0/(((
    ((0.57 * mix (2.0, 0.7, tmpvar_3)) * (0.57 * mix (2.0, 0.7, tmpvar_3)))
   * 
    (0.57 * mix (2.0, 0.7, tmpvar_3))
  ) * (0.57 * 
    mix (2.0, 0.7, tmpvar_3)
  ))));
  mediump float tmpvar_4;
  tmpvar_4 = pow (_Color.z, 0.454545);
  tmpvar_1.z = (1.0/(((
    ((0.475 * mix (2.0, 0.7, tmpvar_4)) * (0.475 * mix (2.0, 0.7, tmpvar_4)))
   * 
    (0.475 * mix (2.0, 0.7, tmpvar_4))
  ) * (0.475 * 
    mix (2.0, 0.7, tmpvar_4)
  ))));
  kInvWavelength = tmpvar_1;
  highp float far_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesVertex.xyz));
  tmpvar_6 = -(tmpvar_12);
  far_5 = 0.0;
  if ((tmpvar_12.y >= 0.0)) {
    highp vec3 frontColor_13;
    highp vec3 samplePoint_14;
    far_5 = (sqrt((
      (1.050625 + (tmpvar_12.y * tmpvar_12.y))
     - 1.0)) - tmpvar_12.y);
    highp float tmpvar_15;
    tmpvar_15 = (1.0 - (dot (tmpvar_12, vec3(0.0, 1.0001, 0.0)) / 1.0001));
    highp float tmpvar_16;
    tmpvar_16 = (exp((-0.00287 + 
      (tmpvar_15 * (0.459 + (tmpvar_15 * (3.83 + 
        (tmpvar_15 * (-6.8 + (tmpvar_15 * 5.25)))
      ))))
    )) * 0.2460318);
    highp float tmpvar_17;
    tmpvar_17 = (far_5 / 2.0);
    highp float tmpvar_18;
    tmpvar_18 = (tmpvar_17 * 40.00004);
    highp vec3 tmpvar_19;
    tmpvar_19 = (tmpvar_12 * tmpvar_17);
    highp vec3 tmpvar_20;
    tmpvar_20 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_19 * 0.5));
    highp float tmpvar_21;
    tmpvar_21 = sqrt(dot (tmpvar_20, tmpvar_20));
    highp float tmpvar_22;
    tmpvar_22 = exp((160.0002 * (1.0 - tmpvar_21)));
    highp float tmpvar_23;
    tmpvar_23 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, tmpvar_20) / tmpvar_21));
    highp float tmpvar_24;
    tmpvar_24 = (1.0 - (dot (tmpvar_12, tmpvar_20) / tmpvar_21));
    frontColor_13 = (exp((
      -((tmpvar_16 + (tmpvar_22 * (
        (0.25 * exp((-0.00287 + (tmpvar_23 * 
          (0.459 + (tmpvar_23 * (3.83 + (tmpvar_23 * 
            (-6.8 + (tmpvar_23 * 5.25))
          ))))
        ))))
       - 
        (0.25 * exp((-0.00287 + (tmpvar_24 * 
          (0.459 + (tmpvar_24 * (3.83 + (tmpvar_24 * 
            (-6.8 + (tmpvar_24 * 5.25))
          ))))
        ))))
      ))))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_22 * tmpvar_18));
    samplePoint_14 = (tmpvar_20 + tmpvar_19);
    highp float tmpvar_25;
    tmpvar_25 = sqrt(dot (samplePoint_14, samplePoint_14));
    highp float tmpvar_26;
    tmpvar_26 = exp((160.0002 * (1.0 - tmpvar_25)));
    highp float tmpvar_27;
    tmpvar_27 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, samplePoint_14) / tmpvar_25));
    highp float tmpvar_28;
    tmpvar_28 = (1.0 - (dot (tmpvar_12, samplePoint_14) / tmpvar_25));
    frontColor_13 = (frontColor_13 + (exp(
      (-((tmpvar_16 + (tmpvar_26 * 
        ((0.25 * exp((-0.00287 + 
          (tmpvar_27 * (0.459 + (tmpvar_27 * (3.83 + 
            (tmpvar_27 * (-6.8 + (tmpvar_27 * 5.25)))
          ))))
        ))) - (0.25 * exp((-0.00287 + 
          (tmpvar_28 * (0.459 + (tmpvar_28 * (3.83 + 
            (tmpvar_28 * (-6.8 + (tmpvar_28 * 5.25)))
          ))))
        ))))
      ))) * ((kInvWavelength * 0.03141593) + 0.01256637))
    ) * (tmpvar_26 * tmpvar_18)));
    samplePoint_14 = (samplePoint_14 + tmpvar_19);
    tmpvar_7 = (frontColor_13 * (kInvWavelength * 0.05));
    tmpvar_8 = (frontColor_13 * 0.02);
  } else {
    highp vec3 frontColor_1_29;
    highp vec3 samplePoint_1_30;
    highp float scaledLength_1_31;
    highp float temp_32;
    highp float cameraOffset_33;
    far_5 = (-0.0001 / min (-1e-05, tmpvar_12.y));
    highp vec3 tmpvar_34;
    tmpvar_34 = (vec3(0.0, 1.0001, 0.0) + (far_5 * tmpvar_12));
    highp float tmpvar_35;
    highp float tmpvar_36;
    tmpvar_36 = (1.0 - dot (-(tmpvar_12), tmpvar_34));
    tmpvar_35 = (0.25 * exp((-0.00287 + 
      (tmpvar_36 * (0.459 + (tmpvar_36 * (3.83 + 
        (tmpvar_36 * (-6.8 + (tmpvar_36 * 5.25)))
      ))))
    )));
    highp float tmpvar_37;
    tmpvar_37 = (1.0 - dot (_WorldSpaceLightPos0.xyz, tmpvar_34));
    cameraOffset_33 = (0.9996001 * tmpvar_35);
    temp_32 = ((0.25 * exp(
      (-0.00287 + (tmpvar_37 * (0.459 + (tmpvar_37 * 
        (3.83 + (tmpvar_37 * (-6.8 + (tmpvar_37 * 5.25))))
      ))))
    )) + tmpvar_35);
    highp float tmpvar_38;
    tmpvar_38 = (far_5 / 2.0);
    scaledLength_1_31 = (tmpvar_38 * 40.00004);
    highp vec3 tmpvar_39;
    tmpvar_39 = (tmpvar_12 * tmpvar_38);
    samplePoint_1_30 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_39 * 0.5));
    highp float tmpvar_40;
    tmpvar_40 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    frontColor_1_29 = (exp((
      (cameraOffset_33 - (tmpvar_40 * temp_32))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_40 * scaledLength_1_31));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    highp float tmpvar_41;
    tmpvar_41 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    highp vec3 tmpvar_42;
    tmpvar_42 = exp(((cameraOffset_33 - 
      (tmpvar_41 * temp_32)
    ) * (
      (kInvWavelength * 0.03141593)
     + 0.01256637)));
    frontColor_1_29 = (frontColor_1_29 + (tmpvar_42 * (tmpvar_41 * scaledLength_1_31)));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    tmpvar_7 = (frontColor_1_29 * ((kInvWavelength * 0.05) + 0.02));
    highp vec3 tmpvar_43;
    tmpvar_43 = clamp (tmpvar_42, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
    tmpvar_8 = tmpvar_43;
  };
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform mediump float _HdrExposure;
uniform mediump vec3 _GroundColor;
uniform mediump vec3 _SunTint;
uniform mediump float _SunStrength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 col_1;
  if ((xlv_TEXCOORD0.y < 0.0)) {
    mediump float eyeCos_2;
    mediump vec3 tmpvar_3;
    tmpvar_3 = normalize(xlv_TEXCOORD0);
    highp float tmpvar_4;
    tmpvar_4 = dot (_WorldSpaceLightPos0.xyz, tmpvar_3);
    eyeCos_2 = tmpvar_4;
    mediump float tmpvar_5;
    tmpvar_5 = (eyeCos_2 * eyeCos_2);
    mediump float temp_6;
    mediump float tmpvar_7;
    tmpvar_7 = (1.9801 - (-1.98 * eyeCos_2));
    mediump float tmpvar_8;
    tmpvar_8 = clamp ((tmpvar_7 / 0.01), 0.0, 1.0);
    temp_6 = ((tmpvar_8 * (tmpvar_8 * 
      (3.0 - (2.0 * tmpvar_8))
    )) * tmpvar_7);
    mediump float tmpvar_9;
    tmpvar_9 = max (temp_6, 0.0001);
    temp_6 = tmpvar_9;
    col_1 = (((0.75 + 
      (0.75 * tmpvar_5)
    ) * xlv_TEXCOORD1) + ((
      ((((0.01001645 * 
        (1.0 + tmpvar_5)
      ) / tmpvar_9) * xlv_TEXCOORD2) * _LightColor0.xyz)
     * _SunTint) * _SunStrength));
  } else {
    col_1 = (xlv_TEXCOORD1 + (_GroundColor * xlv_TEXCOORD2));
  };
  col_1 = (col_1 * _HdrExposure);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = col_1;
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec3 _Color;
highp vec3 kInvWavelength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump float tmpvar_2;
  tmpvar_2 = pow (_Color.x, 0.454545);
  tmpvar_1.x = (1.0/(((
    ((0.65 * mix (2.0, 0.7, tmpvar_2)) * (0.65 * mix (2.0, 0.7, tmpvar_2)))
   * 
    (0.65 * mix (2.0, 0.7, tmpvar_2))
  ) * (0.65 * 
    mix (2.0, 0.7, tmpvar_2)
  ))));
  mediump float tmpvar_3;
  tmpvar_3 = pow (_Color.y, 0.454545);
  tmpvar_1.y = (1.0/(((
    ((0.57 * mix (2.0, 0.7, tmpvar_3)) * (0.57 * mix (2.0, 0.7, tmpvar_3)))
   * 
    (0.57 * mix (2.0, 0.7, tmpvar_3))
  ) * (0.57 * 
    mix (2.0, 0.7, tmpvar_3)
  ))));
  mediump float tmpvar_4;
  tmpvar_4 = pow (_Color.z, 0.454545);
  tmpvar_1.z = (1.0/(((
    ((0.475 * mix (2.0, 0.7, tmpvar_4)) * (0.475 * mix (2.0, 0.7, tmpvar_4)))
   * 
    (0.475 * mix (2.0, 0.7, tmpvar_4))
  ) * (0.475 * 
    mix (2.0, 0.7, tmpvar_4)
  ))));
  kInvWavelength = tmpvar_1;
  highp float far_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesVertex.xyz));
  tmpvar_6 = -(tmpvar_12);
  far_5 = 0.0;
  if ((tmpvar_12.y >= 0.0)) {
    highp vec3 frontColor_13;
    highp vec3 samplePoint_14;
    far_5 = (sqrt((
      (1.050625 + (tmpvar_12.y * tmpvar_12.y))
     - 1.0)) - tmpvar_12.y);
    highp float tmpvar_15;
    tmpvar_15 = (1.0 - (dot (tmpvar_12, vec3(0.0, 1.0001, 0.0)) / 1.0001));
    highp float tmpvar_16;
    tmpvar_16 = (exp((-0.00287 + 
      (tmpvar_15 * (0.459 + (tmpvar_15 * (3.83 + 
        (tmpvar_15 * (-6.8 + (tmpvar_15 * 5.25)))
      ))))
    )) * 0.2460318);
    highp float tmpvar_17;
    tmpvar_17 = (far_5 / 2.0);
    highp float tmpvar_18;
    tmpvar_18 = (tmpvar_17 * 40.00004);
    highp vec3 tmpvar_19;
    tmpvar_19 = (tmpvar_12 * tmpvar_17);
    highp vec3 tmpvar_20;
    tmpvar_20 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_19 * 0.5));
    highp float tmpvar_21;
    tmpvar_21 = sqrt(dot (tmpvar_20, tmpvar_20));
    highp float tmpvar_22;
    tmpvar_22 = exp((160.0002 * (1.0 - tmpvar_21)));
    highp float tmpvar_23;
    tmpvar_23 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, tmpvar_20) / tmpvar_21));
    highp float tmpvar_24;
    tmpvar_24 = (1.0 - (dot (tmpvar_12, tmpvar_20) / tmpvar_21));
    frontColor_13 = (exp((
      -((tmpvar_16 + (tmpvar_22 * (
        (0.25 * exp((-0.00287 + (tmpvar_23 * 
          (0.459 + (tmpvar_23 * (3.83 + (tmpvar_23 * 
            (-6.8 + (tmpvar_23 * 5.25))
          ))))
        ))))
       - 
        (0.25 * exp((-0.00287 + (tmpvar_24 * 
          (0.459 + (tmpvar_24 * (3.83 + (tmpvar_24 * 
            (-6.8 + (tmpvar_24 * 5.25))
          ))))
        ))))
      ))))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_22 * tmpvar_18));
    samplePoint_14 = (tmpvar_20 + tmpvar_19);
    highp float tmpvar_25;
    tmpvar_25 = sqrt(dot (samplePoint_14, samplePoint_14));
    highp float tmpvar_26;
    tmpvar_26 = exp((160.0002 * (1.0 - tmpvar_25)));
    highp float tmpvar_27;
    tmpvar_27 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, samplePoint_14) / tmpvar_25));
    highp float tmpvar_28;
    tmpvar_28 = (1.0 - (dot (tmpvar_12, samplePoint_14) / tmpvar_25));
    frontColor_13 = (frontColor_13 + (exp(
      (-((tmpvar_16 + (tmpvar_26 * 
        ((0.25 * exp((-0.00287 + 
          (tmpvar_27 * (0.459 + (tmpvar_27 * (3.83 + 
            (tmpvar_27 * (-6.8 + (tmpvar_27 * 5.25)))
          ))))
        ))) - (0.25 * exp((-0.00287 + 
          (tmpvar_28 * (0.459 + (tmpvar_28 * (3.83 + 
            (tmpvar_28 * (-6.8 + (tmpvar_28 * 5.25)))
          ))))
        ))))
      ))) * ((kInvWavelength * 0.03141593) + 0.01256637))
    ) * (tmpvar_26 * tmpvar_18)));
    samplePoint_14 = (samplePoint_14 + tmpvar_19);
    tmpvar_7 = (frontColor_13 * (kInvWavelength * 0.05));
    tmpvar_8 = (frontColor_13 * 0.02);
  } else {
    highp vec3 frontColor_1_29;
    highp vec3 samplePoint_1_30;
    highp float scaledLength_1_31;
    highp float temp_32;
    highp float cameraOffset_33;
    far_5 = (-0.0001 / min (-1e-05, tmpvar_12.y));
    highp vec3 tmpvar_34;
    tmpvar_34 = (vec3(0.0, 1.0001, 0.0) + (far_5 * tmpvar_12));
    highp float tmpvar_35;
    highp float tmpvar_36;
    tmpvar_36 = (1.0 - dot (-(tmpvar_12), tmpvar_34));
    tmpvar_35 = (0.25 * exp((-0.00287 + 
      (tmpvar_36 * (0.459 + (tmpvar_36 * (3.83 + 
        (tmpvar_36 * (-6.8 + (tmpvar_36 * 5.25)))
      ))))
    )));
    highp float tmpvar_37;
    tmpvar_37 = (1.0 - dot (_WorldSpaceLightPos0.xyz, tmpvar_34));
    cameraOffset_33 = (0.9996001 * tmpvar_35);
    temp_32 = ((0.25 * exp(
      (-0.00287 + (tmpvar_37 * (0.459 + (tmpvar_37 * 
        (3.83 + (tmpvar_37 * (-6.8 + (tmpvar_37 * 5.25))))
      ))))
    )) + tmpvar_35);
    highp float tmpvar_38;
    tmpvar_38 = (far_5 / 2.0);
    scaledLength_1_31 = (tmpvar_38 * 40.00004);
    highp vec3 tmpvar_39;
    tmpvar_39 = (tmpvar_12 * tmpvar_38);
    samplePoint_1_30 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_39 * 0.5));
    highp float tmpvar_40;
    tmpvar_40 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    frontColor_1_29 = (exp((
      (cameraOffset_33 - (tmpvar_40 * temp_32))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_40 * scaledLength_1_31));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    highp float tmpvar_41;
    tmpvar_41 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    highp vec3 tmpvar_42;
    tmpvar_42 = exp(((cameraOffset_33 - 
      (tmpvar_41 * temp_32)
    ) * (
      (kInvWavelength * 0.03141593)
     + 0.01256637)));
    frontColor_1_29 = (frontColor_1_29 + (tmpvar_42 * (tmpvar_41 * scaledLength_1_31)));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    tmpvar_7 = (frontColor_1_29 * ((kInvWavelength * 0.05) + 0.02));
    highp vec3 tmpvar_43;
    tmpvar_43 = clamp (tmpvar_42, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
    tmpvar_8 = tmpvar_43;
  };
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform mediump float _HdrExposure;
uniform mediump vec3 _GroundColor;
uniform mediump vec3 _SunTint;
uniform mediump float _SunStrength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 col_1;
  if ((xlv_TEXCOORD0.y < 0.0)) {
    mediump float eyeCos_2;
    mediump vec3 tmpvar_3;
    tmpvar_3 = normalize(xlv_TEXCOORD0);
    highp float tmpvar_4;
    tmpvar_4 = dot (_WorldSpaceLightPos0.xyz, tmpvar_3);
    eyeCos_2 = tmpvar_4;
    mediump float tmpvar_5;
    tmpvar_5 = (eyeCos_2 * eyeCos_2);
    mediump float temp_6;
    mediump float tmpvar_7;
    tmpvar_7 = (1.9801 - (-1.98 * eyeCos_2));
    mediump float tmpvar_8;
    tmpvar_8 = clamp ((tmpvar_7 / 0.01), 0.0, 1.0);
    temp_6 = ((tmpvar_8 * (tmpvar_8 * 
      (3.0 - (2.0 * tmpvar_8))
    )) * tmpvar_7);
    mediump float tmpvar_9;
    tmpvar_9 = max (temp_6, 0.0001);
    temp_6 = tmpvar_9;
    col_1 = (((0.75 + 
      (0.75 * tmpvar_5)
    ) * xlv_TEXCOORD1) + ((
      ((((0.01001645 * 
        (1.0 + tmpvar_5)
      ) / tmpvar_9) * xlv_TEXCOORD2) * _LightColor0.xyz)
     * _SunTint) * _SunStrength));
  } else {
    col_1 = (xlv_TEXCOORD1 + (_GroundColor * xlv_TEXCOORD2));
  };
  col_1 = (col_1 * _HdrExposure);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = col_1;
  gl_FragData[0] = tmpvar_10;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec3 _Color;
highp vec3 kInvWavelength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump float tmpvar_2;
  tmpvar_2 = pow (_Color.x, 0.454545);
  tmpvar_1.x = (1.0/(((
    ((0.65 * mix (2.0, 0.7, tmpvar_2)) * (0.65 * mix (2.0, 0.7, tmpvar_2)))
   * 
    (0.65 * mix (2.0, 0.7, tmpvar_2))
  ) * (0.65 * 
    mix (2.0, 0.7, tmpvar_2)
  ))));
  mediump float tmpvar_3;
  tmpvar_3 = pow (_Color.y, 0.454545);
  tmpvar_1.y = (1.0/(((
    ((0.57 * mix (2.0, 0.7, tmpvar_3)) * (0.57 * mix (2.0, 0.7, tmpvar_3)))
   * 
    (0.57 * mix (2.0, 0.7, tmpvar_3))
  ) * (0.57 * 
    mix (2.0, 0.7, tmpvar_3)
  ))));
  mediump float tmpvar_4;
  tmpvar_4 = pow (_Color.z, 0.454545);
  tmpvar_1.z = (1.0/(((
    ((0.475 * mix (2.0, 0.7, tmpvar_4)) * (0.475 * mix (2.0, 0.7, tmpvar_4)))
   * 
    (0.475 * mix (2.0, 0.7, tmpvar_4))
  ) * (0.475 * 
    mix (2.0, 0.7, tmpvar_4)
  ))));
  kInvWavelength = tmpvar_1;
  highp float far_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump vec3 tmpvar_8;
  highp vec4 tmpvar_9;
  highp vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = _glesVertex.xyz;
  tmpvar_9 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_10));
  highp mat3 tmpvar_11;
  tmpvar_11[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_11[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_11[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = normalize((tmpvar_11 * _glesVertex.xyz));
  tmpvar_6 = -(tmpvar_12);
  far_5 = 0.0;
  if ((tmpvar_12.y >= 0.0)) {
    highp vec3 frontColor_13;
    highp vec3 samplePoint_14;
    far_5 = (sqrt((
      (1.050625 + (tmpvar_12.y * tmpvar_12.y))
     - 1.0)) - tmpvar_12.y);
    highp float tmpvar_15;
    tmpvar_15 = (1.0 - (dot (tmpvar_12, vec3(0.0, 1.0001, 0.0)) / 1.0001));
    highp float tmpvar_16;
    tmpvar_16 = (exp((-0.00287 + 
      (tmpvar_15 * (0.459 + (tmpvar_15 * (3.83 + 
        (tmpvar_15 * (-6.8 + (tmpvar_15 * 5.25)))
      ))))
    )) * 0.2460318);
    highp float tmpvar_17;
    tmpvar_17 = (far_5 / 2.0);
    highp float tmpvar_18;
    tmpvar_18 = (tmpvar_17 * 40.00004);
    highp vec3 tmpvar_19;
    tmpvar_19 = (tmpvar_12 * tmpvar_17);
    highp vec3 tmpvar_20;
    tmpvar_20 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_19 * 0.5));
    highp float tmpvar_21;
    tmpvar_21 = sqrt(dot (tmpvar_20, tmpvar_20));
    highp float tmpvar_22;
    tmpvar_22 = exp((160.0002 * (1.0 - tmpvar_21)));
    highp float tmpvar_23;
    tmpvar_23 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, tmpvar_20) / tmpvar_21));
    highp float tmpvar_24;
    tmpvar_24 = (1.0 - (dot (tmpvar_12, tmpvar_20) / tmpvar_21));
    frontColor_13 = (exp((
      -((tmpvar_16 + (tmpvar_22 * (
        (0.25 * exp((-0.00287 + (tmpvar_23 * 
          (0.459 + (tmpvar_23 * (3.83 + (tmpvar_23 * 
            (-6.8 + (tmpvar_23 * 5.25))
          ))))
        ))))
       - 
        (0.25 * exp((-0.00287 + (tmpvar_24 * 
          (0.459 + (tmpvar_24 * (3.83 + (tmpvar_24 * 
            (-6.8 + (tmpvar_24 * 5.25))
          ))))
        ))))
      ))))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_22 * tmpvar_18));
    samplePoint_14 = (tmpvar_20 + tmpvar_19);
    highp float tmpvar_25;
    tmpvar_25 = sqrt(dot (samplePoint_14, samplePoint_14));
    highp float tmpvar_26;
    tmpvar_26 = exp((160.0002 * (1.0 - tmpvar_25)));
    highp float tmpvar_27;
    tmpvar_27 = (1.0 - (dot (_WorldSpaceLightPos0.xyz, samplePoint_14) / tmpvar_25));
    highp float tmpvar_28;
    tmpvar_28 = (1.0 - (dot (tmpvar_12, samplePoint_14) / tmpvar_25));
    frontColor_13 = (frontColor_13 + (exp(
      (-((tmpvar_16 + (tmpvar_26 * 
        ((0.25 * exp((-0.00287 + 
          (tmpvar_27 * (0.459 + (tmpvar_27 * (3.83 + 
            (tmpvar_27 * (-6.8 + (tmpvar_27 * 5.25)))
          ))))
        ))) - (0.25 * exp((-0.00287 + 
          (tmpvar_28 * (0.459 + (tmpvar_28 * (3.83 + 
            (tmpvar_28 * (-6.8 + (tmpvar_28 * 5.25)))
          ))))
        ))))
      ))) * ((kInvWavelength * 0.03141593) + 0.01256637))
    ) * (tmpvar_26 * tmpvar_18)));
    samplePoint_14 = (samplePoint_14 + tmpvar_19);
    tmpvar_7 = (frontColor_13 * (kInvWavelength * 0.05));
    tmpvar_8 = (frontColor_13 * 0.02);
  } else {
    highp vec3 frontColor_1_29;
    highp vec3 samplePoint_1_30;
    highp float scaledLength_1_31;
    highp float temp_32;
    highp float cameraOffset_33;
    far_5 = (-0.0001 / min (-1e-05, tmpvar_12.y));
    highp vec3 tmpvar_34;
    tmpvar_34 = (vec3(0.0, 1.0001, 0.0) + (far_5 * tmpvar_12));
    highp float tmpvar_35;
    highp float tmpvar_36;
    tmpvar_36 = (1.0 - dot (-(tmpvar_12), tmpvar_34));
    tmpvar_35 = (0.25 * exp((-0.00287 + 
      (tmpvar_36 * (0.459 + (tmpvar_36 * (3.83 + 
        (tmpvar_36 * (-6.8 + (tmpvar_36 * 5.25)))
      ))))
    )));
    highp float tmpvar_37;
    tmpvar_37 = (1.0 - dot (_WorldSpaceLightPos0.xyz, tmpvar_34));
    cameraOffset_33 = (0.9996001 * tmpvar_35);
    temp_32 = ((0.25 * exp(
      (-0.00287 + (tmpvar_37 * (0.459 + (tmpvar_37 * 
        (3.83 + (tmpvar_37 * (-6.8 + (tmpvar_37 * 5.25))))
      ))))
    )) + tmpvar_35);
    highp float tmpvar_38;
    tmpvar_38 = (far_5 / 2.0);
    scaledLength_1_31 = (tmpvar_38 * 40.00004);
    highp vec3 tmpvar_39;
    tmpvar_39 = (tmpvar_12 * tmpvar_38);
    samplePoint_1_30 = (vec3(0.0, 1.0001, 0.0) + (tmpvar_39 * 0.5));
    highp float tmpvar_40;
    tmpvar_40 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    frontColor_1_29 = (exp((
      (cameraOffset_33 - (tmpvar_40 * temp_32))
     * 
      ((kInvWavelength * 0.03141593) + 0.01256637)
    )) * (tmpvar_40 * scaledLength_1_31));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    highp float tmpvar_41;
    tmpvar_41 = exp((160.0002 * (1.0 - 
      sqrt(dot (samplePoint_1_30, samplePoint_1_30))
    )));
    highp vec3 tmpvar_42;
    tmpvar_42 = exp(((cameraOffset_33 - 
      (tmpvar_41 * temp_32)
    ) * (
      (kInvWavelength * 0.03141593)
     + 0.01256637)));
    frontColor_1_29 = (frontColor_1_29 + (tmpvar_42 * (tmpvar_41 * scaledLength_1_31)));
    samplePoint_1_30 = (samplePoint_1_30 + tmpvar_39);
    tmpvar_7 = (frontColor_1_29 * ((kInvWavelength * 0.05) + 0.02));
    highp vec3 tmpvar_43;
    tmpvar_43 = clamp (tmpvar_42, vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0));
    tmpvar_8 = tmpvar_43;
  };
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = tmpvar_6;
  xlv_TEXCOORD1 = tmpvar_7;
  xlv_TEXCOORD2 = tmpvar_8;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _WorldSpaceLightPos0;
uniform lowp vec4 _LightColor0;
uniform mediump float _HdrExposure;
uniform mediump vec3 _GroundColor;
uniform mediump vec3 _SunTint;
uniform mediump float _SunStrength;
varying mediump vec3 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
void main ()
{
  mediump vec3 col_1;
  if ((xlv_TEXCOORD0.y < 0.0)) {
    mediump float eyeCos_2;
    mediump vec3 tmpvar_3;
    tmpvar_3 = normalize(xlv_TEXCOORD0);
    highp float tmpvar_4;
    tmpvar_4 = dot (_WorldSpaceLightPos0.xyz, tmpvar_3);
    eyeCos_2 = tmpvar_4;
    mediump float tmpvar_5;
    tmpvar_5 = (eyeCos_2 * eyeCos_2);
    mediump float temp_6;
    mediump float tmpvar_7;
    tmpvar_7 = (1.9801 - (-1.98 * eyeCos_2));
    mediump float tmpvar_8;
    tmpvar_8 = clamp ((tmpvar_7 / 0.01), 0.0, 1.0);
    temp_6 = ((tmpvar_8 * (tmpvar_8 * 
      (3.0 - (2.0 * tmpvar_8))
    )) * tmpvar_7);
    mediump float tmpvar_9;
    tmpvar_9 = max (temp_6, 0.0001);
    temp_6 = tmpvar_9;
    col_1 = (((0.75 + 
      (0.75 * tmpvar_5)
    ) * xlv_TEXCOORD1) + ((
      ((((0.01001645 * 
        (1.0 + tmpvar_5)
      ) / tmpvar_9) * xlv_TEXCOORD2) * _LightColor0.xyz)
     * _SunTint) * _SunStrength));
  } else {
    col_1 = (xlv_TEXCOORD1 + (_GroundColor * xlv_TEXCOORD2));
  };
  col_1 = (col_1 * _HdrExposure);
  mediump vec4 tmpvar_10;
  tmpvar_10.w = 1.0;
  tmpvar_10.xyz = col_1;
  gl_FragData[0] = tmpvar_10;
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