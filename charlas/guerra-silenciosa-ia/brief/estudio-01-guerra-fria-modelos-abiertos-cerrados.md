# Estudio 01 — La Guerra Fría de la IA

## Modelos abiertos, modelos cerrados y la disputa entre Estados Unidos y China

**Estado:** notas de estudio, no guion definitivo  
**Corte de información:** 13 de agosto de 2026  
**Pregunta rectora:** ¿los modelos abiertos distribuyen poder o son el nuevo instrumento de influencia de las potencias?

---

## 1. Tesis provisional

> **La apertura no abolió la lucha por el poder: se convirtió en una de sus armas. Estados Unidos intenta controlar los cuellos de botella y exportar el stack; China intenta difundir modelos y convertir adopción en influencia. La pregunta para América Latina no es qué bandera prefiere, sino cuánto derecho de salida conserva.**

Esta tesis no dice que ambos sistemas políticos sean equivalentes. Dice algo más específico: ambos Estados tratan la IA como infraestructura estratégica y buscan que terceros países dependan de sus respectivos ecosistemas, aunque emplean combinaciones diferentes de mercado, regulación, hardware, nube, licencias y control político.

La propia política estadounidense ya usa el lenguaje de una carrera por el “dominio global” y propone exportar paquetes que incluyan hardware, centros de datos, nube, modelos, aplicaciones, estándares y gobernanza.[3][16]

China, por su parte, incorporó el desarrollo de un ecosistema de código abierto a su iniciativa estatal “AI Plus” y ofrece compartir tecnología y productos abiertos, especialmente con el Sur Global.[5][6]

### Fórmula corta para la charla

> **Estados Unidos quiere venderte la infraestructura completa. China quiere regalarte —o abaratarte— el motor. Ninguno lo hace por filantropía.**

**Límite:** “regalarte el motor” es una metáfora. El uso real requiere hardware, energía, operación, mantenimiento y talento; además, no todos los modelos chinos son abiertos ni todos los modelos estadounidenses son cerrados.

---

## 2. Primero, limpiar el vocabulario

La expresión “modelo abierto” oculta diferencias decisivas.

| Categoría | Qué recibe el usuario | Qué puede hacer | Qué sigue oculto o controlado |
|---|---|---|---|
| **API cerrada** | Acceso remoto al modelo | Consultarlo dentro de términos, precios y límites del proveedor | Pesos, entrenamiento, infraestructura; el proveedor puede modificar o retirar el servicio |
| **Pesos abiertos** | Parámetros descargables y, normalmente, código de inferencia | Ejecutar, adaptar, cuantizar y alojar el modelo según la licencia | Puede faltar el dataset, el código completo de entrenamiento, los checkpoints y el proceso reproducible |
| **Pesos abiertos con restricciones** | Pesos descargables bajo licencia propia | Usar y modificar dentro de límites contractuales | Restricciones de usuarios, usos, territorios o escala |
| **IA de código abierto según OSI** | Pesos, código y suficiente información de datos para estudiar, modificar y recrear un sistema equivalente | Usar, estudiar, modificar y compartir para cualquier propósito | No exige que todo dato protegido sea redistribuido, pero sí información detallada sobre su procedencia y tratamiento |

La Open Source Initiative exige las libertades de usar, estudiar, modificar y compartir, junto con acceso a parámetros, código y suficiente información sobre los datos y el entrenamiento.[7] Por eso conviene llamar **open-weight** o **de pesos abiertos** a modelos descargables que no publican todo su proceso de construcción.

### Casos útiles

- **Qwen3:** Alibaba publica pesos en varios tamaños bajo Apache 2.0 y documenta ejecución local, despliegue y ajuste. Su propio repositorio lo denomina explícitamente “open-weight”.[19]
- **DeepSeek-R1:** DeepSeek liberó código y modelos bajo MIT y permite usar los outputs para ajuste y destilación.[10] Eso da amplias libertades prácticas, pero no equivale automáticamente a reproducir todo el entrenamiento según la definición de OSI.
- **gpt-oss:** OpenAI lanzó dos modelos de pesos abiertos bajo Apache 2.0; el mayor puede ejecutarse en una GPU de 80 GB y el menor requiere 16 GB de memoria según la empresa.[9]
- **Llama 3.x:** Meta lo presenta como abierto, pero OSI sostiene que su licencia no concede libertades de código abierto para cualquier usuario o finalidad.[8]

### Frase picante, pero precisa

> **En IA, “abierto” a veces significa: podés entrar a la cocina, pero no te mostramos los ingredientes ni cómo cocinamos.**

---

## 3. ¿Por qué hablar de una Guerra Fría?

### Lo que sí se parece

1. **Control de tecnologías estratégicas.** Desde octubre de 2022, Estados Unidos impuso controles sobre chips avanzados, supercomputación y equipamiento para fabricar semiconductores con destino a China.[4]
2. **Competencia por bloques y estándares.** Washington busca explícitamente que aliados adopten sistemas, hardware y estándares estadounidenses, y plantea contrarrestar la influencia china en organismos internacionales.[3][16]
3. **Propaganda tecnológica.** Cada actor presenta su propia expansión como universal: Estados Unidos habla de valores, innovación y seguridad; China habla de bienes públicos, acceso universal y cooperación con el Sur Global.[3][6]
4. **Carrera industrial y militar.** Ambos conectan IA con competitividad, seguridad nacional, infraestructura y capacidad estatal.[3][5][16]
5. **Países no alineados como terreno de disputa.** La competencia se juega también en qué modelos, nubes, chips y estándares adoptan terceros países.

### Los controles no son un muro fijo

La política estadounidense cambió de instrumento sin abandonar el objetivo estratégico. En mayo de 2025, el Departamento de Comercio anunció que no aplicaría la regla general de difusión de IA aprobada en enero y prometió reemplazarla, mientras emitía nuevas guías para impedir el uso de chips estadounidenses en modelos chinos y advertía sobre aceleradores Huawei.[23] En enero de 2026, BIS pasó a revisar caso por caso licencias para exportar Nvidia H200, AMD MI325X y chips similares a compradores chinos que cumplieran condiciones de seguridad y control.[24]

> **Los controles no son un muro: son una válvula. Washington la cierra por seguridad y la abre por mercado cuando le conviene.**

**Límite:** la metáfora no implica que las restricciones hayan desaparecido. Describe una política selectiva y adaptable que combina seguridad nacional, ventaja industrial, alianzas y ventas.

### Lo que no se debe exagerar

- No existe una separación económica total: hardware, capital, manufactura, investigación y mercados siguen conectados.
- No toda empresa estadounidense obedece de manera automática al Estado ni todo laboratorio chino es una simple extensión del gobierno.
- “Estados Unidos versus China” no agota el mapa: Taiwán, Países Bajos, Japón, Corea del Sur, Europa, India y países del Golfo ocupan capas críticas.
- La disputa por Taiwán no nació con los chips y no puede reducirse a TSMC.

### Fórmula equilibrada

> **No estamos ante dos internets completamente separadas, pero sí ante una interdependencia cada vez más armada: cada conexión puede convertirse en un punto de presión.**

---

## 4. El tablero real: poder por capas

La guerra no se decide solo en el modelo con mejor benchmark.

| Capa | Ventaja o instrumento de EE. UU. | Ventaja o instrumento de China | Pregunta crítica |
|---|---|---|---|
| **Chips y aceleradores** | Diseñadores, ecosistema CUDA, controles de exportación | Sustitución local, Huawei, optimización bajo escasez | ¿Puede el control ralentizar sin acelerar la autonomía rival? |
| **Fabricación** | Influencia sobre aliados y equipamiento; expansión fabril | Escala industrial y política de autosuficiencia | ¿Quién controla el cuello de botella y por cuánto tiempo? |
| **Nube y centros de datos** | Hiperscalers globales y mayor infraestructura instalada | Gran mercado interno, despliegue industrial y expansión propia | ¿Quién puede apagar, limitar o encarecer el servicio? |
| **Modelos frontera** | Más capital, más modelos notables y liderazgo de varias empresas | Brecha de capacidad muy reducida y gran eficiencia | ¿Importa más ser primero o ser suficientemente bueno y barato? |
| **Modelos open-weight** | gpt-oss, ecosistema histórico de software, proveedores de inferencia | Qwen, DeepSeek y un ecosistema creciente de derivados | ¿La difusión abierta cambia el centro de gravedad? |
| **Aplicaciones y datos** | Plataformas globales, software empresarial y capital | Manufactura, robótica, logística y datos del mundo físico | ¿Quién aprende más del despliegue real? |
| **Normas y narrativas** | “Libertad”, seguridad, estándares y alianzas | “Bien público”, soberanía, cooperación y Sur Global | ¿Qué dependencia se esconde detrás del discurso universal? |

El Stanford AI Index 2026 afirma que la brecha entre los mejores modelos estadounidenses y chinos en Arena prácticamente se cerró: los modelos intercambiaron el liderazgo desde comienzos de 2025 y, a marzo de 2026, Claude Opus 4.6 registraba 1.503 puntos Elo frente a 1.464 de Dola-Seed-2.0 Preview, una ventaja de 39 puntos o 2,7%. Arena se basa en comparaciones y preferencias humanas; no es una medida universal de todas las capacidades.[21]

Sin embargo, Estados Unidos produjo 59 modelos notables durante 2025 frente a 35 de China.[20] La inversión privada estadounidense registrada en IA fue de US$285.900 millones frente a US$12.400 millones en China —23,1 veces más—, aunque Stanford advierte que esa comparación subestima el gasto canalizado por fondos estatales chinos.[22]

**Lectura:** China no necesita dominar todas las capas para alterar el equilibrio. Le alcanza con neutralizar suficientes cuellos de botella y hacer que sus modelos sean “suficientemente buenos”, baratos y fáciles de desplegar.

---

## 5. La paradoja central: el abierto autoritario y el cerrado liberal

Esta es una buena provocación porque contiene una contradicción real, pero hay que explicarla sin caricaturas.

### Lado estadounidense

- Las principales empresas estadounidenses mantuvieron muchos de sus sistemas frontera detrás de APIs.
- El informe de Stanford señala que 47 de 102 modelos notables de 2025 se ofrecieron por API y que 81 de 102 no publicaron su código de entrenamiento; solo cuatro lo publicaron como código abierto.[20]
- Al mismo tiempo, la política estadounidense declara que quiere fomentar modelos open-source y open-weight, y OpenAI volvió a publicar pesos con gpt-oss.[9][16]
- Washington quiere exportar no solo modelos, sino un paquete tecnológico y regulatorio completo.[3]

### Lado chino

- Qwen y DeepSeek permiten descargar, modificar y autoalojar pesos bajo licencias permisivas.[10][19]
- El gobierno chino promueve un ecosistema abierto como parte de su política industrial.[5]
- Pero la regulación de servicios generativos exige sostener los “valores socialistas fundamentales” y prohíbe, entre otros contenidos, mensajes que socaven el sistema socialista o la unidad nacional.[18]
- Un estudio académico sobre DeepSeek-R1 encontró censura política incorporada al modelo local; también mostró que podía eludirse en gran parte de sus pruebas, precisamente porque los pesos eran modificables.[17]

### La formulación correcta

> **China puede abrir los pesos sin abrir el régimen. Estados Unidos puede defender la libertad mientras concentra el modelo detrás de una API. La licencia del modelo y la libertad política son dimensiones distintas.**

Esto no iguala ambos regímenes. Distingue dos preguntas que suelen confundirse:

1. ¿Podemos descargar y modificar el artefacto técnico?
2. ¿Bajo qué poder político, comercial y jurídico fue construido y será utilizado?

---

## 6. ¿Abrir distribuye poder?

### Sí, en algunos sentidos concretos

Un modelo descargado puede:

- ejecutarse sin enviar cada consulta al proveedor original;
- adaptarse a idioma, dominio y cultura local;
- reducir dependencia de una API y de sus cambios de precio;
- conservarse aunque el proveedor retire el servicio;
- auditarse y modificarse más profundamente que una caja negra remota;
- alimentar competencia entre proveedores de inferencia.

Una vez publicados los pesos, retirarlos de todas las copias es prácticamente imposible. Anthropic, que advierte sobre los riesgos de los modelos muy capaces, reconoce que los pesos abiertos dan mayor control al cliente y que prohibir su uso empresarial no resolvería los escenarios de seguridad que plantea.[15]

### No, no por sí solo

Los pesos no entregan automáticamente:

- chips;
- electricidad barata y estable;
- centros de datos;
- personal especializado;
- datasets locales de calidad;
- capacidad para entrenar desde cero;
- control sobre librerías, nubes y cadenas de suministro;
- poder para fijar estándares internacionales.

### Distinción útil

> **Pesos abiertos dan autonomía operativa. Soberanía tecnológica exige capacidad sistémica.**

Un país puede autoalojar Qwen o gpt-oss y seguir dependiendo de Nvidia, de una nube extranjera, de bibliotecas mantenidas afuera y de capital importado. Aun así, el autoalojamiento puede ser una mejora real frente a depender exclusivamente de una API revocable.

---

## 7. La apertura como estrategia china

Una lectura ingenua dice: “China abre porque cree en la comunidad”. Una lectura igualmente ingenua dice: “todo lo abierto por China es una trampa”. La hipótesis más útil es estratégica:

1. Las restricciones de chips encarecen competir únicamente por fuerza bruta.[4]
2. Eso incentiva eficiencia, destilación, arquitecturas que usan menos recursos y despliegue sobre hardware diverso.
3. Publicar pesos traslada parte del costo de inferencia, adaptación y distribución a usuarios y proveedores globales.
4. Cada integración y derivado amplía el ecosistema del modelo base.
5. La adopción puede crear estándares de facto y vínculos con nubes, herramientas y productos del proveedor.
6. La fabricación, robótica y logística chinas pueden producir datos del mundo físico que la mera superioridad en benchmarks no garantiza.

Un informe de la U.S.-China Economic and Security Review Commission —fuente estadounidense con mandato explícito sobre la competencia con China— sostiene que la difusión de modelos chinos produce un ciclo entre adopción e iteración y que el ecosistema Qwen superaba los 100.000 derivados al publicarse el informe.[14]

**Cómo usar esa fuente:** sirve como evidencia de que Washington interpreta la apertura china como estrategia industrial. No debe presentarse como observador neutral ni como prueba definitiva de las intenciones internas de Pekín.

### Frase picante

> **Si Estados Unidos inventó el modelo como servicio, China está probando el modelo como influencia.**

---

## 8. La apertura como problema estadounidense

Estados Unidos enfrenta una contradicción:

- Si sus empresas cierran los mejores modelos, capturan ingresos, datos de uso y control de producto.
- Si los abren, difunden capacidad, reducen el control posterior y facilitan que competidores los adapten.
- Si restringen demasiado el acceso, terceros países tienen más incentivos para adoptar alternativas chinas.
- Si no restringen, aceptan que adversarios también accedan a capacidades estadounidenses.

El regreso de OpenAI a los pesos abiertos con gpt-oss muestra que el ecosistema estadounidense no es homogéneamente cerrado.[9] El plan oficial también reconoce los modelos abiertos como parte de la competencia.[16]

### Pregunta incómoda

> **¿La seguridad es siempre la razón para cerrar, o a veces es la palabra elegante para conservar una renta monopólica?**

### Contraargumento que debe aparecer

No todo cierre es una excusa comercial. Los modelos descargables muy capaces no permiten retirar versiones, imponer límites de uso ni actualizar guardrails en todas las copias. Ese riesgo es real y merece evaluación según capacidad, no una fe automática en que “abierto” equivale a seguro o bueno.[15]

---

## 9. La propaganda de ambos lados

| Relato | Parte cierta | Lo que oculta |
|---|---|---|
| **“IA estadounidense = libertad”** | Mayor pluralismo político y empresarial; ecosistema de investigación y software muy fuerte | Concentración corporativa, cajas negras, dependencia de APIs, control extraterritorial y objetivo explícito de dominio |
| **“IA china = bien público global”** | Modelos descargables, baratos, adaptables y útiles para países con menos recursos | Censura política, estrategia industrial, dependencia de proveedores y ausencia de pluralismo político equivalente |
| **“Open source democratiza la IA”** | Amplía acceso, modificación y opciones de despliegue | El cómputo, los datos, la energía y la fabricación siguen concentrados |
| **“Los controles de exportación detienen a China”** | Elevan costos y dificultan el acceso a hardware de frontera | También estimulan sustitución, eficiencia, contrabando y estrategias menos dependientes del hardware controlado |
| **“El mejor benchmark gana la carrera”** | Capacidad técnica importa | Precio, distribución, confianza, idioma, integración, energía y derecho de salida pueden importar más |

---

## 10. América Latina: no alineamiento con capacidad de salida

La peor pregunta sería: “¿debemos elegir Estados Unidos o China?”. La mejor es:

> **¿Cómo evitamos que elegir proveedor se confunda con entregar soberanía?**

### Una postura posible para la charla

**No alineamiento tecnológico pragmático:** usar componentes de múltiples ecosistemas, exigir portabilidad y construir capacidades locales donde sí es viable.

Eso implica:

1. Evitar que sistemas públicos críticos dependan de una sola API.
2. Conservar datasets, embeddings, evaluaciones y capas de aplicación en formatos portables.
3. Poder mover cargas entre modelos estadounidenses, chinos, europeos y locales.
4. Autoalojar cuando privacidad, continuidad o costo lo justifiquen.
5. Invertir en evaluación en español y lenguas regionales, no solo adoptar rankings anglófonos.
6. Negociar centros de datos con transparencia energética, hídrica, fiscal y laboral.
7. Diferenciar soberanía absoluta —probablemente inviable— de capacidad real para sustituir componentes.

### Tesis regional

> **América Latina no necesita fabricar cada transistor para tener política tecnológica. Pero si no controla datos, evaluación, compras públicas y capacidad de migración, no tiene soberanía: tiene un contrato.**

---

## 11. Siete tesis provocadoras para probar en la charla

### 1. “La nube es un nombre amable para la computadora de otro país.”

**Verdad que revela:** jurisdicción, infraestructura y capacidad de corte.  
**Riesgo de exageración:** los servicios distribuidos no pertenecen necesariamente a un Estado único.

### 2. “El modelo abierto puede ser el misil cultural más barato de esta Guerra Fría.”

**Verdad que revela:** difusión, estándares, idioma, derivados y adopción.  
**Riesgo:** militariza el lenguaje; usarla como provocación y aclarar que hablamos de influencia, no de arma cinética.

### 3. “China abre los pesos; Silicon Valley abre una cuenta mensual.”

**Verdad que revela:** contraste entre distribución y renta por API.  
**Riesgo:** omite gpt-oss, Llama y otros modelos estadounidenses descargables.

### 4. “Open-weight no significa sin dueño; significa que el dueño no puede impedir todas las copias.”

**Verdad que revela:** irreversibilidad y posibilidad de forks.  
**Riesgo:** las licencias siguen importando y el usuario aún depende de infraestructura.

### 5. “La soberanía de IA comienza cuando cambiar de modelo deja de ser una crisis institucional.”

**Verdad que revela:** portabilidad y derecho de salida.  
**Riesgo:** cambiar modelos puede alterar calidad, seguridad y comportamiento; requiere evaluación propia.

### 6. “Tal vez la pregunta no sea quién llega primero a la AGI, sino quién logra que el mundo construya encima de su modelo.”

**Verdad que revela:** adopción y efectos de red.  
**Riesgo:** el liderazgo de frontera puede seguir produciendo ventajas decisivas.

### 7. “Cuando una empresa dice ‘seguridad’ y un Estado dice ‘soberanía’, conviene revisar quién conserva el interruptor.”

**Verdad que revela:** poder operativo detrás del lenguaje moral.  
**Riesgo:** no toda medida de seguridad es captura de poder y no toda soberanía es autarquía.

---

## 12. Preguntas para estudiar juntos

1. Si un modelo chino puede ejecutarse localmente y uno estadounidense solo mediante API, ¿cuál ofrece más autonomía técnica?
2. Si el modelo local reproduce censura política aprendida, ¿la posibilidad de modificarlo compensa ese sesgo?
3. ¿Preferimos un modelo auditable que puede ser desalineado o uno cerrado cuyos riesgos solo audita su propietario?
4. ¿Debe un gobierno latinoamericano aceptar una pequeña pérdida de rendimiento a cambio de portabilidad y control de datos?
5. ¿Qué capa mínima deberíamos controlar: modelo, datos, evaluación, infraestructura o compras públicas?
6. ¿La apertura china es una convicción, una necesidad impuesta por restricciones de cómputo o ambas?
7. ¿Los controles estadounidenses ralentizan a China o la obligan a construir una cadena más autónoma?
8. Si el modelo es abierto pero corre sobre chips y nubes extranjeras, ¿cuánta soberanía se obtuvo realmente?

---

## 13. Qué está establecido, qué es interpretación y qué sigue abierto

### Establecido por fuentes

- Estados Unidos impuso controles a chips avanzados, supercomputación y fabricación de semiconductores destinados a China.[4]
- La política estadounidense busca exportar paquetes completos de tecnología de IA y extender la adopción de sus estándares.[3]
- China promueve oficialmente integración masiva de IA y un ecosistema abierto.[5]
- DeepSeek-R1, Qwen3 y gpt-oss tienen pesos publicados bajo licencias permisivas, con diferencias en documentación y reproducibilidad.[9][10][19]
- La brecha Arena Elo entre los mejores modelos estadounidenses y chinos se redujo fuertemente según el AI Index 2026.[21]
- La publicación de código de entrenamiento es mucho menos común que el acceso por API o la publicación de pesos.[20]
- La regulación china impone requisitos ideológicos a servicios generativos públicos.[18]

### Interpretaciones defendibles

- China utiliza la apertura como mecanismo de difusión e influencia.
- Estados Unidos busca convertir su control de varias capas del stack en una alianza tecnológica duradera.
- Los modelos abiertos pueden funcionar como mecanismo de no alineamiento para terceros países.
- El verdadero indicador de soberanía no es “tener un modelo nacional”, sino conservar capacidad de salida y sustitución.

### Disputado o todavía incierto

- Si la estrategia abierta china será sostenible económicamente.
- Si los controles de exportación producirán una ventaja estadounidense duradera o una cadena china más autónoma.
- Si los riesgos de modelos abiertos de frontera superan sus beneficios sociales y competitivos.
- Si la adopción global de modelos chinos se convertirá en dependencia de largo plazo o en una base fácilmente reemplazable.
- Si los futuros modelos más capaces de ambos países seguirán abiertos o serán tratados como activos nacionales restringidos.

---

## 14. Conclusión provisional

La dicotomía “abierto versus cerrado” no sustituye a “Estados Unidos versus China”; la atraviesa.

- Estados Unidos posee ventajas profundas en capital, chips diseñados, nube, empresas de frontera y alianzas.
- China convirtió la restricción en incentivo para eficiencia, despliegue industrial y difusión de modelos de pesos abiertos.
- Un modelo abierto puede reducir el poder de una empresa y aumentar la influencia del ecosistema que lo originó al mismo tiempo.
- Descargar pesos no equivale a controlar la cadena material.
- Para América Latina, la mejor estrategia no es la pureza tecnológica, sino **interoperabilidad, evaluación propia, control de datos y derecho de salida**.

> **Quizá la Guerra Fría de la IA no se gane construyendo la inteligencia más poderosa, sino logrando que todos los demás construyan su futuro sobre tu infraestructura.**

## Sources

[3] https://www.whitehouse.gov/presidential-actions/2025/07/promoting-the-export-of-the-american-ai-technology-stack — White House — Promoting the Export of the American AI Technology Stack
[4] https://www.bis.gov/press-release/commerce-implements-new-export-controls-advanced-computing-semiconductor-manufacturing-items-peoples — BIS — 2022 advanced computing and semiconductor export controls
[5] https://english.www.gov.cn/policies/latestreleases/202508/27/content_WS68ae7976c6d0868f4e8f51a0.html — State Council — AI Plus guideline
[6] https://english.www.gov.cn/news/202507/26/content_WS6884bea8c6d0868f4e8f4732.html — Chinese premier on global AI governance
[7] https://opensource.org/ai/open-source-ai-definition — OSI — Open Source AI Definition 1.0
[8] https://opensource.org/blog/metas-llama-license-is-still-not-open-source — OSI — Meta Llama license is not Open Source
[9] https://openai.com/index/introducing-gpt-oss — OpenAI — Introducing gpt-oss
[10] https://api-docs.deepseek.com/news/news250120 — DeepSeek — R1 release
[14] https://www.uscc.gov/research/two-loops-how-chinas-open-ai-strategy-reinforces-its-industrial-dominance — USCC — Two Loops: China open AI strategy
[15] https://www.anthropic.com/news/position-open-weights-models — Anthropic — Position on open-weights models
[16] https://www.ai.gov/action-plan — United States — AI Action Plan
[17] https://arxiv.org/html/2505.12625v1 — R1dacted — Investigating Local Censorship in DeepSeek R1
[18] https://www.chinalawtranslate.com/en/generative-ai-interim — China Law Translate — Interim Measures for Generative AI
[19] https://github.com/QwenLM/Qwen3 — QwenLM — Qwen3 repository and license
[20] https://hai.stanford.edu/assets/files/ai_index_report_2026_chapter_1_research_development.pdf — Stanford HAI — AI Index 2026 Chapter 1: Research and Development
[21] https://hai.stanford.edu/ai-index/2026-ai-index-report/technical-performance — Stanford HAI — AI Index 2026: Technical Performance
[22] https://hai.stanford.edu/ai-index/2026-ai-index-report/economy — Stanford HAI — AI Index 2026: Economy
[23] https://www.bis.gov/press-release/department-commerce-announces-rescission-biden-era-artificial-intelligence-diffusion-rule-strengthens — BIS — Rescission of AI Diffusion Rule and chip guidance
[24] https://www.bis.gov/press-release/department-commerce-revises-license-review-policy-semiconductors-exported-china — BIS — 2026 semiconductor license review policy for China
