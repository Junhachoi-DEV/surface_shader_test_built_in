Shader "Rito/Water"
{
    Properties
    {
        _BumpMap("Normal Map", 2D) = "bump" {}
        _Cube("Cube", Cube) = ""{}

        [Space]
        _Alpha("Alpha", Range(0, 1)) = 0.8
        _Tiling("Normal Tiling", Range(1, 10)) = 1
        _Strength("Normal Strength", Range(0, 2)) = 1
    }
        SubShader
        {
            Tags { "RenderType" = "Transparent" "Queue" = "Transparent" }

            CGPROGRAM
            #pragma surface surf Lambert alpha:fade
            #pragma target 3.0

            sampler2D _BumpMap;
            samplerCUBE _Cube;

            struct Input
            {
                float2 uv_BumpMap;
                float3 worldRefl;
                INTERNAL_DATA
            };

            float _Alpha;
            float _Tiling;
            float _Strength;

            void surf(Input IN, inout SurfaceOutput o)
            {
                float3 reflColor = texCUBE(_Cube, WorldReflectionVector(IN, o.Normal));
                o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap * _Tiling)) * _Strength;
                o.Emission = reflColor;
                o.Alpha = _Alpha;
            }
            ENDCG
        }
            FallBack "Legacy Shaders/Transparent/VertexLit"
}