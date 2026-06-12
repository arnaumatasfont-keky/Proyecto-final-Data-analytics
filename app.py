import streamlit as st

st.set_page_config(
    page_title="Análisis de Sellers en Olist",
    page_icon="📊",
    layout="wide"
)

st.title("Análisis de Sellers en Olist")
st.subheader(
    "Identificación de sellers de alto valor y sellers de riesgo en un marketplace e-commerce"
)

st.image("images/hero_ecommerce.png", use_container_width=True)

st.divider()

st.header("Dataset")

st.markdown("""
- Brazilian E-Commerce Public Dataset by Olist
- Aproximadamente 100.000 pedidos
- Datos entre 2016 y 2018
- Tablas principales:
    - Customers
    - Orders
    - Order Items
    - Products
    - Sellers
    - Reviews
    - Payments
""")

st.image("images/eer_diagram.png", use_container_width=800)

st.divider()

st.header("Motivación personal")

st.markdown("""
- Interés en el análisis de negocio y marketplaces e-commerce
- Interés en entender cómo detectar sellers problemáticos
""")

st.divider()

st.header("Contexto de negocio")

st.markdown("""
- Olist conecta empresas y tiendas con clientes mediante marketplaces online
- El sector del e-commerce es muy utilizado
- El éxito de un marketplace depende de la calidad de sus sellers
""")

st.divider()

st.header("Objetivo del proyecto")

st.markdown("""
- Analizar el rendimiento de los sellers
- Detectar sellers de alto valor económico
- Detectar sellers con riesgo operacional
- Combinar:
    - Revenue
    - Reviews
    - Rendimiento logístico
- Crear dashboards orientados a un Marketplace Management Team
""")

st.divider()

st.header("Pipeline del proyecto")


st.image("images/pipeline.png", use_container_width=True)


st.divider()

st.header("Insights & Conclusiones")

st.markdown("""
- Un pequeño grupo de sellers aporta un gran valor relativo
- Algunos sellers de alto valor presentan riesgo operacional
- Los Standard Sellers generan el mayor revenue agregado
- Revenue ≠ calidad operacional
- Es importante combinar el análisis de:
    - revenue
    - satisfacción cliente
    - logística     
- Es necesario monitorear a los sellers para detectar problemas operacionales y mantener la calidad del marketplace    
""")

st.divider()

st.header("Líneas futuras")

st.markdown("""
- Análisis más profundo por categorías
- Predicción de riesgo de sellers
- Sistemas automáticos de scoring
- Estudiar mejor la relación de delay y satisfacción cliente
""")

st.divider()

st.header("GRACIAS SU ATENCIÓN")

st.markdown("""
- Autor: Arnau Matas
""")