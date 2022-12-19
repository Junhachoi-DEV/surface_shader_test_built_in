Shader "Custom/test_water"
{
    Properties
    {
        _MainTex("tex", 2D) = "White"{}
        _CUBE("CubeMap", CUBE) = ""{}
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
        samplerCUBE _CUBE;
        struct Input
        {
            float2 uv_MainTex;
            float3 worldRefl;
            INTERNAL_DATA
        };

        
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);

            float4 reflection = texCUBE(_CUBE, WorldReflectionVector(IN, o.Normal));
            o.Emission = reflection;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
