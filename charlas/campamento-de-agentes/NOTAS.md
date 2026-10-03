# Notas del speaker: Un campamento de agentes

cómo Travelsats publica en RRSS todos los días con Grok Bot
Carlos Dugarte (@LaZuricata) · Grok Bot Meetup Mendoza · sábado 3 oct 2026, 17:00 · Polo TIC, Godoy Cruz

Duración objetivo: unos 17 min + Q&A. Suma de tiempos por slide (sin Q&A): 15:00; con transiciones, pausas y risas da unos 16 a 17 min. 15 slides, Ridgeline como hilo conductor.

Las mismas notas viven dentro de cada slide como `<aside class="notes">` (ocultas en proyección). Si editás una, editá las dos.

Placeholders `[dato a completar: ...]` que tenés que resolver antes de la charla (solo están en notas, nunca en pantalla): slides 03, 05, 08, 15.

---

## 01. Portada

`01-cover.astro` · 30 s · arranca en 0:00

Hola, ¿cómo andan? Soy Carlos, en X me encuentran como @LaZuricata. Fundé Travelsats, una startup de turismo con Bitcoin acá en Mendoza. Hoy no vengo a hablar de modelos ni de benchmarks. Vengo a contarles cómo una startup chiquita, que en la práctica soy yo, publica en redes todos los días. El truco es que no lo hago solo: tengo un campamento de agentes. Cada uno tiene nombre, rol y reglas. Les voy a mostrar cómo está armado, cómo trabaja Ridgeline, el agente que publica, qué más automatizamos y por qué hoy podés delegar casi todo para dedicarte a construir.

---

## 02. Hook

`02-hook.astro` · 45 s · arranca en 0:30

Levanten la mano los que alguna vez dijeron "este mes publico todos los días". Ahora bajen la mano los que lo cumplieron. Ahí está. Publicar todos los días, siendo uno solo, con un producto que construir, no se sostiene. No es falta de ganas, es falta de horas. Y para una startup chica las redes son casi el único canal que tenés. Entonces cambié la pregunta: no "cómo publico más", sino "cómo armo un equipo que publique y yo solo diga sí o no". Ese equipo es el campamento.

---

## 03. Qué es Travelsats

`03-travelsats.astro` · 1 min · arranca en 1:15

Travelsats conecta viajeros con guías y anfitriones locales, persona a persona, con Bitcoin. La idea es que el valor quede entre el que viaja y el que recibe, sin una capa gruesa de intermediarios. Tenemos tres caminos: Xplorer (el viajero), Baqueano (el guía local) y Agency. Y hay una línea que no cruzamos: no custodiamos fondos, no pedimos documentos, no nos metemos entre vos y la persona que viniste a conocer. Estado honesto: hoy el sitio es una waitlist. Todavía no lanzamos el beta, y eso va a importar más adelante cuando hable de lo que el contenido puede y no puede prometer. [dato a completar: cuánta gente hay en la waitlist, si querés decirlo]

---

## 04. El problema

`04-problema.astro` · 1 min · arranca en 2:15

Un post parece una cosa, pero son seis. Elegir de qué hablar. Escribir el copy con la voz de la marca, y la nuestra es en inglés porque el viajero es internacional. Armar la imagen. Revisar que no prometa algo que el producto todavía no hace. Programarlo a la hora correcta en cada red. Y medir al otro día para aprender. Multiplicalo por varios formatos por día y dos redes, X y Nostr. Eso es un trabajo de tiempo completo para alguien. Ninguno de esos seis pasos es difícil por separado. El problema es hacerlos todos, todos los días. Y eso es justo lo que los agentes hacen bien.

---

## 05. El campamento (Ridgeline en foco)

`05-campamento.astro` · 1 min 15 s · arranca en 3:15

Este es el campamento. Cada agente es un asistente de Grok Bot con un nombre, un frente y un resultado que le pertenece. Zhulong es el comando: yo hablo con Zhulong y Zhulong despacha. Refugio atiende hello@ y la waitlist, Cartógrafo y Cumbre hacen SEO, Pionero lleva producto y ventas, Cóndor desarrolla la app, Hornero mantiene la computadora del equipo y Bobi es mi asistente personal. Los nombres son de montaña a propósito: es un campamento, no una oficina. Pero miren el recuadro blanco: Ridgeline. Es la voz pública de Travelsats, escribe todo lo que sale en X y en Nostr, y además lidera el frente de SEO. Toda la charla de hoy gira alrededor de Ridgeline: cómo se despierta, qué hace adentro de su flujo, con qué herramientas y cómo aprende de sus propios números. Si entienden a Ridgeline, entienden el campamento. [dato a completar: desde cuándo funciona el campamento]

---

## 06. El flujo de Ridgeline

`06-flujo-ridgeline.astro` · 1 min 15 s · arranca en 4:30

Esto es lo que pasa adentro de Ridgeline para que exista un post. Todo lo automático en el campamento corre de 19 a 23:59, así que Ridgeline se despierta a la noche, en su ventana. Uno: va a la base de datos en Supabase y elige una actividad que todavía no publicó; lleva un registro de las que ya usó para no repetir. Dos: trae las fotos reales de esa actividad desde Cloudinary. Tres: con el título y la descripción de la ficha, escribe el post con la voz de Travelsats, en inglés y en 200 caracteres como máximo. Cuatro: según la rutina arma una placa con la marca o un carrusel de tres fotos, y lo deja en Postiz como borrador para X y para Nostr. Y cinco: me lo muestra terminado y me pregunta: ¿lo agendo o lo publico ya? Yo digo sí o no. Por eso la placa que preparó anoche sale a la mañana: la de Garganta del Diablo quedó agendada para hoy a las 10:30. Yo no armo el post: lo apruebo.

---

## 07. La fuente: actividades reales

`07-fuente.astro` · 1 min · arranca en 5:45

Un error común es pedirle a un modelo "escribime un post de viajes". Te da postales genéricas. Ridgeline no inventa: lee. Tenemos una base de datos en Supabase con el catálogo de actividades turísticas que viene de Lauke Tours: hoy son 135 actividades en cinco destinos: Mendoza, Bariloche, Malargüe, Villa La Angostura y San Rafael. Y en Cloudinary, nuestra galería, hay 1.019 fotos reales de esas actividades, migradas para no depender de un sitio externo que se puede caer. Cada post arranca de una ficha real: nombre, lugar, duración, qué incluye, y sus fotos. Además usamos las campañas de Travelsats como banco de contenido. Eso hace que el copy tenga datos concretos y que no tengamos que andar desmintiendo cosas. Y con 135 actividades, Ridgeline tiene material para meses sin repetir.

---

## 08. Herramientas que suman

`08-herramientas.astro` · 1 min 15 s · arranca en 6:45

Estas son las herramientas que usa el campamento, y casi todas pasan por Ridgeline. Postiz es un gestor de redes open source: ahí Ridgeline deja los borradores y desde ahí se agenda, se programa o se publica directo en X y en Nostr. El conector de X le deja buscar, leer menciones y tendencias y medir impresiones. Supabase guarda el catálogo de actividades y Cloudinary es la galería de fotos. ElevenLabs, conectado por MCP, pone la voz, los efectos y la música de los videos promocionales, y los másteres quedan en Google Drive. Postfix en un VPS propio es nuestro servidor de correo para mandar las publicaciones por mail, sin depender del algoritmo de nadie. Y Vercel aloja la app, y un agente vigila ahí los errores. Un consejo: si vas a tener servicios propios, como Postfix o Postiz, conseguite un VPS con Coolify, que es un PaaS self-hosted: deployás tus servicios como en Vercel, pero en tu máquina y con tus reglas. [dato a completar: si querés, a quién le llegan hoy esos mails y con qué frecuencia]

---

## 09. Ejemplo real: de la foto a la placa

`09-foto-a-placa.astro` · 1 min · arranca en 8:00

Este es un caso real, de hoy. A la izquierda, la foto de la actividad: Garganta del Diablo, un trekking con rappel de dieciocho metros en Potrerillos. A la derecha, la placa que armó el sistema: "Heading to Mendoza?", la actividad, un dato del lugar y "Full day". El caption que la acompaña es: "Got Mendoza lined up? Garganta del Diablo is a full day in Potrerillos. You trek the gorge first, then rappel eighteen meters where the rock keeps the cold. Ask in DM." Yo la aprobé y quedó programada para hoy a las 10:30. Si la buscan en @travelsats, ya está publicada. Nadie del equipo abrió un editor de imágenes.

---

## 10. Tres modos

`10-tres-modos.astro` · 1 min 15 s · arranca en 9:00

Ridgeline publica en tres modos, y las reglas de cada uno viven en un skill, un archivo con instrucciones que cualquier agente del campamento puede seguir. Place: el protagonista es el lugar, como Quebrada de Matienzo en el Parque Aconcagua. Invite: una invitación suave, "Heading to Mendoza?", con el cierre "Next dates in DM". Y el tercero es el carrusel de la tarde: tres fotos reales de una actividad, sin placa, con un caption de lugar. Estas tres son bodegas del Valle de Uco que salen de nuestra galería en Cloudinary. Ridgeline va alternando: nunca el mismo modo dos veces seguidas, y antes de escribir revisa los últimos cinco captions para no repetir cómo arranca ni cómo cierra. Y hay cosas prohibidas en una placa de lugar: nada de sats, Lightning ni Nostr. El viajero mira un lugar, no un protocolo.

---

## 11. Lo que ya corre solo

`11-automatizado.astro` · 1 min 15 s · arranca en 10:15

Esto es lo que hoy corre solo, sin que yo lo pida. Tres rutinas son de Ridgeline: la placa diaria, el carrusel de la tarde y Bitcoin trends, que lunes, miércoles y viernes a las 21:07 mira de qué se habla en el mundo bitcoiner y lo conecta con un lugar de Argentina, con un tope de unos 20 centavos de dólar por corrida. Zhulong revisa de lunes a viernes, tres veces por noche, que travelsats.ar esté arriba y busca errores en producción en Vercel; solo avisa si hay algo para actuar. Hornero corre una auditoría nocturna de dependencias y los lunes una review de arquitectura. Un caso real: el 1 de octubre la auditoría detectó una vulnerabilidad crítica en Next, y al día siguiente ya estaba arreglada en un PR y en producción. La regla, desde el 15 de septiembre: lo automático corre de 19 a 23:59, y nada publica ni manda solo. Y fuera del campamento, Grok Bot me ayuda con otras cosas. Libélula es mi asistente principal: coordina al resto y me ayuda en el día a día, por ejemplo armando esta charla. Bobi es mi asistente personal. Sifu es mi guía de cultura y filosofía china para mi camino marcial: Choy Li Fut, Tai Chi y Qigong. Y las charlas, como esta, salen de notas del vault.

---

## 12. Ridgeline aprende de sus números

`12-aprende.astro` · 1 min 15 s · arranca en 11:30

Lo último que armamos es que Ridgeline aprenda solo de sus números. Publica a través de Postiz en X y en Nostr. A las 24 horas mide cada post: impresiones, interacciones, tasa de interacción y clics al perfil, y marca aparte los que yo cité, porque esos vienen inflados. Cada lunes compara franjas y formatos y, con eso, me sugiere en qué día y a qué hora conviene publicar cada tipo de post. Yo digo sí y el ciclo arranca de nuevo, con más datos. Para tener datos de verdad estamos corriendo un test de cuatro semanas, del 30 de septiembre al 27 de octubre, que rota la placa, el carrusel y Bitcoin trends entre cuatro franjas: 9:17, 13:17, 18:47 y 21:17. El dato de arranque: las placas y los videos rinden, los carruseles quedan últimos. El test va a decir si es el horario o el formato. El agente no adivina cuándo publicar: lo mide.

---

## 13. Una computadora en la nube. Y la terminal.

`13-terminal.astro` · 1 min 15 s · arranca en 12:45

Todo esto pasa en una computadora. Grok Bot tiene una computadora Linux en la nube, persistente, que comparten todos los agentes del campamento: los archivos, las herramientas instaladas y las sesiones quedan ahí de un día para el otro. Y la forma en que los agentes trabajan con código es la terminal. Con GitHub CLI, gh, Hornero clona el repo de la app, abre issues y PRs y respeta la protección de ramas: nada va directo a main. Con Grok Build, que es un agente de código en la terminal, se lee, se cambia y se testea el código del proyecto. Con pnpm auditamos dependencias y con bun corremos y testeamos. Esta misma charla es un repo Astro que se buildea con bun en esa computadora. Y el deploy a producción sale solo con mi sí. Mi conclusión: hoy las CLIs son protagonistas. Si una herramienta tiene CLI, un agente la puede usar como vos, y eso multiplica lo que podés delegar.

---

## 14. CONSTRUIR

`14-construir.astro` · 1 min · arranca en 14:00

Si se llevan una sola idea, que sea esta. Si estás armando tu proyecto personal, o llevando tu negocio con pocos recursos, no tenés un equipo de marketing, ni un SRE, ni alguien que audite tus dependencias a la noche. Agentes como Grok Bot son ideales justamente para eso: les delegás las tareas que se repiten, publicar, medir, vigilar, auditar, y vos te quedás con lo que nadie puede hacer por vos. Yo con Ridgeline dejé de pensar en qué publico hoy. Ese tiempo volvió a lo que más importa: construir. Arrancá con un agente, un frente y un resultado claro. Cuando funcione, sumá el segundo. Y usá el tiempo que te devuelven para construir.

---

## 15. Cierre

`15-cierre.astro` · Q&A · arranca en 15:00

Eso es el campamento. Un founder, un equipo de agentes con nombre y rol, una memoria compartida y reglas claras sobre qué decide cada uno. Si quieren ver cómo sale el contenido, sigan a @travelsats en X. Si quieren charlar de agentes, Bitcoin o turismo, me encuentran como @LaZuricata. Y si viajan, o son guías, anótense en la waitlist de travelsats.ar. ¿Preguntas?

**Respuestas preparadas para Q&A:**

- ¿Cuánto cuesta? [dato a completar: costo mensual aproximado del campamento]. Lo que sí está medido: Bitcoin trends tiene tope de unos USD 0,20 por corrida y un video de 18 s costó unos USD 4,74.
- ¿Por qué no X Ads? Todavía no lanzamos el beta. Primero orgánico y aprender; la pauta espera.
- ¿Por qué Nostr? Es la red nativa de la comunidad bitcoiner y Travelsats usa identidad Nostr. Publicamos en las dos a la vez.
- ¿No pierde autenticidad? El copy sale de actividades reales y yo apruebo cada post. Lo que delego es el trabajo, no el criterio.
