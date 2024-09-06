# 🏀 Análisis Avanzado del Rendimiento de Jugadores de la NBA 🏀

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1200px-New_York_Knicks_logo.svg.png" width="600" height="400" alt="Logo-Proyecto"/>
</p>

# 📌 Descripción del Proyecto

Este repositorio alberga un análisis exhaustivo del rendimiento de los jugadores de la NBA, con un enfoque particular en los New York Knicks. A través de un conjunto de datos detallado que abarca estadísticas tradicionales y avanzadas, hemos implementado diversas técnicas de análisis de datos, tales como:

- 📊 **Estadística Descriptiva**: Cálculo de medias, desviaciones estándar, máximos y mínimos para comprender las distribuciones de las variables.
- 📈 **Visualización de Datos**: Creación de gráficos y diagramas para identificar patrones visuales y tendencias.

# 🎯 Objetivos Principales

- **Reconstruir el equipo**: Seleccionar un quinteto titular y un banco de suplentes con jugadores de alto rendimiento y gran potencial.
- **Identificar jóvenes promesas**: Descubrir y reclutar talentos universitarios prometedores para asegurar el futuro del equipo.
- **Optimizar las estrategias de reclutamiento**: Enfocar los esfuerzos de scouting en las universidades más influyentes de la NBA.

# 📊 Insights

## 📌 Parámetros

Se han establecido los siguientes parámetros para definir a los titulares y a las promesas de acuerdo a su edad:
- **Titulares:** 24-32 años.
- **Suplentes:** 19-24 años.

### 🏀 Dream Team

**Titulares:**
1. 🏅 JAMES HARDEN - PG (Base)
2. 🏅 JOEL EMBIID - C (Pívot)
3. 🏅 GIANNIS ANTETOKOUNMPO - PF (Ala-Pívot)
4. 🏅 JAYSON TATUM - SF (Alero)
5. 🏅 JAYLEN BROWN - SG (Escolta)
   
**Suplentes:**
1. 🌟 TYRESE HALIBURTON - PG (Base)
2. 🌟 SHAI GILGEOUS-ALEXANDER - SG (Escolta)
3. 🌟 KELDON JOHNSON - SF (Alero)
4. 🌟 WENDELL CARTER JR - PF (Ala-Pívot)
5. 🌟 EVAN MOBLEY - C (Pívot)

## 📝 Análisis de Métricas

La métrica más relevante para el análisis fue el **PIE** (Player Impact Estimate). Además, se evaluaron las mejores métricas según las posiciones de los jugadores, considerando:
- Pases 🏀
- Tiros en cancha 🎯
- Tiros triples 🎯
- Asistencias efectivas 🎯
- Pérdidas de balón 🚫
- Puntos por jugador 🏆

Todo esto, junto al análisis de duplas y la evaluación del salario de cada jugador, permitió alcanzar una verdadera sinergia del equipo y la directiva. Se consideró tanto la calidad del jugador como su sinergia con otros jugadores, ajustándose a los niveles presupuestarios permitidos por la NBA 💰.

## 📊 ¿Qué es la métrica PIE?
**PIE** es una estadística que mide el impacto de un jugador en el resultado de un partido, considerando tanto aspectos ofensivos como defensivos. Se expresa como un porcentaje que refleja la influencia total del jugador en el juego. Sin embargo, PIE no incluye la variable de la edad, un factor crucial para evaluar el rendimiento futuro de los jugadores.

## 🛠️ Optimización del Modelo
Para mejorar la precisión de las predicciones, incorporamos la edad en el análisis y creamos un modelo de machine learning utilizando **XGBoost**. Esta técnica de boosting es eficiente y precisa para manejar datos tabulares y predecir el valor futuro de PIE.

## 🚀 Resultados
El modelo XGBoost mejoró la predicción de PIE, permitiendo una selección más informada de los jugadores. Con este enfoque, identificamos jugadores que no solo tienen un alto impacto actual, sino también un rendimiento sostenido en el futuro.

## 🏁 Conclusión
La combinación de la métrica PIE ajustada por edad y el uso de XGBoost nos permitió optimizar la estrategia de selección de jugadores para los New York Knicks, creando un equipo más competitivo y con proyección a largo plazo.

---

## 🏫 Scouting en las Universidades Más Influyentes de la NBA

Las universidades más influyentes en el **Draft de la NBA** son:

- **Kentucky**: Posiciones más drafteadas — Escoltas y Bases.
- **Duke**: Posiciones más drafteadas — Aleros.
- **Arizona**: Posiciones más drafteadas — Aleros y Escoltas.


# 📂 Estructura del Repositorio

- `csv/`: Contiene los csv resultantes del proyecto.
- `notebook_machine_learning/`: Scrip de ML para predecir el rendimiento futuro de jugadores en la NBA.
- - `notebooks_proceso_etl/`: Scripts de ETL para la carga y transformación de datos.
- `powerbi/`: Carpeta con el archivo .pbix.
- `sql/`: Scripts SQL para la creación de tablas y objetos en la base de datos, junto con la ingesta de datos y la automatizacion.

  
# 🔨 Pasos Realizados

- **Creación del Repositorio Público**: Repositorio creado y compartido con el equipo para colaboración.
- **Identificación de Archivos**: Selección y organización de los datasets relevantes.
- **Estructura de Carpetas**: Definición de la estructura de carpetas para un manejo ordenado del proyecto.
- **Creación de la Base de Datos**: Configuración de la base de datos en SQL Server.
- **Definición de Entidades y Tablas**: Identificación y creación de las tablas necesarias para almacenar los datos.
- **Carga de Datos**: Implementación de un flujo ETL para la importación de datos a la base de datos.
- **Validación de Acceso**: Aseguramiento de que todos los miembros del equipo tengan acceso a la base de datos y puedan extraer información sin problemas.
- **Automatización de la Ingesta de Datos**: Implementación de un método automatizado para la ingesta de nuevos datos.
- **Machine Learning**: Modelo XGBoost Regression para predecir el rendimiento futuro de jugadores en la NBA.
- **Crear el Archivo .pbix**: Crear el archivo .pbix en Power BI.
- **Importar la Data a Power BI**: Importación los datos a Power BI conectandose desde SQL-Server.
- **Medidas/Columnas/Relaciones Necesarias para el Análisis**: Creación de las medidas, columnas calculadas y relaciones necesarias para el análisis.
- **Diseñar los Reportes y Gráficos a Usar**: Diseño de los gráficos que se utilizarán en el dashboard.
- **Etapa de Pruebas de Calidad del Reporte**: Pruebas de calidad para asegurar la precisión y funcionalidad del reporte.
  
 # Proceso ETL

## 🌟 **Extracción (Extract)**

- **Fuente de Datos**: Se extrajeron datos de diversas fuentes, incluyendo archivos SQL y CSV. Unificamos la base de datos SQL 'NBA' proporcionada con información adicional recopilada.
- **Datos Faltantes**: Para analizar el rendimiento de los jugadores, faltaban datos estadísticos de su desempeño durante la temporada. El dataset original solo contenía resultados a nivel de equipo.
- **Datos Agregados**: Se añadieron 3 datasets en formato CSV, cada uno correspondiente a una temporada distinta. Estos datos fueron acoplados a las llaves primarias ya existentes en la base de datos y se incorporó una columna de Salario extraída de uno de los datasets.

## 🛠️ **Transformación (Transform)**

- **Limpieza de Datos**: Se trataron los pocos datos nulos de manera minuciosa, rellenándolos según las estadísticas oficiales de la NBA disponibles en su [página web](https://www.nba.com). Se realizó un merge de los datasets y se creó la dimensión `season_id` para identificar el número de temporada.
- **Unificación de Datos**: Se creó una columna unificando `player_id` y `season_id`, formando una clave primaria compuesta (PKC) para garantizar integridad y unicidad. También se añadió la columna `total_team` para listar las iniciales de todos los equipos en los que jugó un jugador durante la temporada.
- **Optimización de la Tabla de Hechos**: En la tabla de hechos `fact_game_stats`, se creó otra clave primaria compuesta para garantizar la integridad y unicidad de los datos en esta tabla clave.
- **Eliminación de Datos No Relevantes**: Las columnas y tablas no influyentes en el análisis fueron eliminadas.
- **Verificación de Integridad**: Se ejecutaron scripts de verificación para asegurar la integridad de los datos, confirmando que todas las llaves primarias y compuestas estuvieran en su lugar y sin duplicados.
- **Formateo de Datos**: Los datos se formatearon para asegurar consistencia en la base de datos, incluyendo la conversión de tipos de datos, estandarización de fechas y números, y la aplicación de reglas de normalización para optimizar rendimiento.

> **Nota:** Para más detalles sobre las transformaciones específicas, consulte con un analista del equipo o revise los notebooks de Jupyter disponibles.

## 🚀 **Carga (Load)**

- **Inserción de Datos**: Los datos transformados se cargaron en la base de datos final utilizando `BULK INSERT` para maximizar la eficiencia. 
- **Actualización de Índices**: Tras la carga, se actualizaron los índices de las tablas para optimizar el rendimiento de futuras consultas.

---

*Este proceso ETL asegura un manejo eficiente de los datos, proporcionando una base sólida para el análisis posterior.*

# Optimizaciones

🚀 **Resumen de Optimizaciones**

Se implementaron múltiples estrategias de optimización para mejorar el rendimiento y la eficiencia en el manejo de datos. A continuación, se detallan las principales medidas adoptadas:

## 🛠️ **Optimización de Estructura de Datos**

- **Formateo de Campos**: Los campos de las columnas fueron formateados con criterio, basado en la naturaleza y utilidad de los datos. Esto facilita su manipulación y análisis.

## 💾 **Gestión de Almacenamiento**

- **Espacio de Almacenamiento**: Se brindó suficiente espacio en el disco a la base de datos y al logfile para garantizar la sostenibilidad futura en caso de crecimiento de la base de datos.

## 🗂️ **Optimización de la Tabla de Hechos**

- **Clave Primaria Compuesta**: La tabla de hechos `fact_player_stats` fue optimizada con una clave primaria compuesta. Esto asegura la integridad de los datos y previene la entrada de datos duplicados o inconsistentes, además de mejorar el rendimiento de las operaciones de la base de datos.

## 🔄 **Diseño ETL**

- **Unicidad de Llaves Primarias**: El diseño del ETL en Python asegura la unicidad de las llaves primarias en todo momento, evitando conflictos y errores en los datos.

## ✅ **Manejo de Datos Nulos**

- **Restricciones NOT NULL**: Se establecieron restricciones para manejar datos nulos correctamente, evitando la inserción de datos incompletos o incorrectos.

## 📝 Estandarización
- **Nombres de Columnas**: Se empleo el estilo de escritura snake_case para estandarizar los nombres de las columnas, salvo en las columnas de estadísticas de jugadores en la tabla fact_player_stats, que mantienen un formato especializado.

## ⚙️ **Índices Estratégicos**

- **Índices de Hiper-Tuneo**: Se insertaron índices estratégicos en columnas para mejorar el rendimiento general de las consultas y operaciones de la base de datos.

---

*Para más detalles sobre las optimizaciones específicas, por favor revisa los documentos de implementación o contacta al equipo de administración de la base de datos.*


# 🛠 Tecnologías Utilizadas

- **Python** 🐍
- **Numpy** 🔢
- **Pandas** 🐼
- **SQL Server** 🗄️
- **Power BI** 📊

# 📂 **Fuentes de Datos**

- **Datos de Desempeño de Jugadores**: Los datos entregados por la organización no incluían información detallada sobre el desempeño de los jugadores por temporada. Para completar el análisis, se incorporaron las siguientes fuentes adicionales:

- **[NBA Database](https://www.kaggle.com/datasets/wyattowalsh/basketball/data?select=csv)**: Información sobre equipos, jugadores (incluyendo el equipo al que pertenecen y su respectivo Draft de la NBA) y el draft de la NBA desde 1946 hasta 2023.

- **[NBA Player Salaries (2022-23 Season)](https://www.kaggle.com/datasets/jamiewelsh2/nba-player-salaries-2022-23-season?select=nba_salaries.csv)**: Datos específicos de la temporada de cada jugador, incluyendo puntos, bloqueos, asistencias, salarios, entre otros.

- **[NBA 2021-2022 Season Player Stats](https://www.kaggle.com/datasets/vivovinco/nba-player-stats)**: Estadísticas detalladas de los jugadores para la temporada 2021-2022.

- **[NBA 2020-2021 Season Player Stats](https://www.kaggle.com/datasets/umutalpaydn/nba-20202021-season-player-stats/)**: Estadísticas detalladas de los jugadores para la temporada 2020-2021.

Estas fuentes adicionales completan el conjunto de datos necesario para un análisis exhaustivo del desempeño de los jugadores en las temporadas especificadas.

# ✨ Cómo Contribuir

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-caracteristica`).
3. Realiza tus cambios y haz commit (`git commit -am 'Añadir nueva característica'`).
4. Sube tus cambios a la rama (`git push origin feature/nueva-caracteristica`).
5. Abre un Pull Request.

# 👥 Autores

<a href="https://github.com/AgustinRolon"><img src="https://github.com/AgustinRolon.png" width="100" height="100" alt="Agustín Rolón"/></a>
<a href="https://github.com/Freitez"><img src="https://github.com/Freitez.png" width="100" height="100" alt="Gerardo Freitez"/></a>
<a href="https://github.com/geramorsucci"><img src="https://github.com/geramorsucci.png" width="100" height="100" alt="Gerardo Morsucci"/></a>
<a href="https://github.com/orejandro79"><img src="https://github.com/orejandro79.png" width="100" height="100" alt="Jaime Orejarena"/></a>
<a href="https://github.com/moisesdavidgonzalez"><img src="https://github.com/moisesdavidgonzalez.png" width="100" height="100" alt="Moises Gonzalez"/></a>

# 💛 Agradecimiento Especial

[![Henry](https://github.com/user-attachments/assets/00eeb5c8-4dcf-4124-ac29-d4ba7b113e6f)](https://www.soyhenry.com)  
[Henry](https://www.soyhenry.com)
