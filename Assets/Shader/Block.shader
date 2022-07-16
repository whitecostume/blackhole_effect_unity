Shader "Unlit/Block"
{
    Properties
    {
    
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry-10" }
        LOD 100


        Pass
        {
            Stencil 
            {
                Ref 50
                Comp Always
                Pass Replace
            }

            ColorMask 0

            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
            };


            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                return half4(1,1,1,0);
            }
            ENDCG
        }
    }
}
