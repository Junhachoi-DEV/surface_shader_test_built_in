Shader "Custom/test_shader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0

        fVal1 ("test_float",float) = 0.5 //이런식으로 추가할수 있다.
        fVal2 ("test_range",Range(0,2)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
            // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        //이런식으로 SurfaceOutputStandard 사용법
        /*struct SurfaceOutputStandard
        {
            fixed3 Albedo;
            fixed3 Normal;
            half3 Emission;
            half Metallic;
            half Smoothness;
            half Occlusion;
            fixed Alpha;
        };*/
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float3 fR = float3(1, 0, 0);
            float3 fG = float3(0, 1, 0);
            float3 fB = float3(0, 0, 1);

            o.Emission = fR.rgb; // fR 에서 r=1 ,g=0, b=0
            //o.Emission = fR + fG + fB;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
