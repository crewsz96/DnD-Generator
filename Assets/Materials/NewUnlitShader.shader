Shader "YourShaders/AlphaDiffuseEmissive" 
 {
     Properties {
         _Color ("Main Color", Color) = (1,1,1,1)
         _AlphaAmount ("Opacity Amount", Range (0.0, 1.0)) = 1.0
         _EmissionColor ("Emission Color", Color) = (1,1,1,1)
         _EmissionPower ("Emission Power", Range (0.1, 3.0)) = 1.2
         _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
     }
     SubShader 
     {
         Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
         LOD 200
         CGPROGRAM
         #pragma surface surf Lambert alpha
         sampler2D _MainTex;
         fixed4 _Color;
         fixed4 _EmissionColor;
         float _EmissionPower;
         float _AlphaAmount;
         struct Input 
         {
             float2 uv_MainTex;
         };
         void surf (Input IN, inout SurfaceOutput o) 
         {
             fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
             o.Albedo = c.rgb;
             o.Emission = _EmissionColor.rgb * _EmissionPower;
             o.Alpha = _AlphaAmount;
         }
         ENDCG
     }
     Fallback "Transparent/VertexLit"
 }