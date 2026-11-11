# reporte-ejecutivo-t5

Reestructurar la base de la compañera (Tarea_Practica_5.Rmd, 25 pp académicas)
en un reporte ejecutivo ≤8 pp según AGENTS.md, conservando el par de
supervivencia (tiempo = Last_Purchase_Days_Ago, evento = Target_Churn).

## Specs

S1 (verbatim, instrucciones profesora): "Como parte de cualquier análisis de
datos, se te solicita realizar un análisis descriptivo de los datos exhaustivo
y una limpieza de la información inicial, esto significa que deberás entender
tu información, su contexto, las variables, investigar si es necesario por
fuentes externas, tratar valores extremos, valores perdidos, describir y hacer
relaciones entre tus variables mediante gráficas, etc."

S2 (verbatim): "Debe haber una sección con el planteamiento del problema y la
propuesta de solución que se debe explicar de la manera más clara posible tanto
como para un lector experimentado como para un lector que conozca poco acerca
de estadística en general sin tener que explicar la parte teórica de manera
exhaustiva."

S3 (verbatim): "De preferencia no incluir códigos, pero si se requieren para
obtener retroalimentación, estos deben estar comentados."

S4 (verbatim): "Debe existir un orden lógico que permita la lectura entre las
imágenes, etc. Por lo que se recomienda darle diseño a sus gráficas (títulos y
nombres adecuados a los ejes por lo menos) y procurar que en su entregable
aparezcan estas en su totalidad y que este referenciadas de manera adecuada."

S5 (verbatim): "Procura evitar mostrar salidas de código repetitivas o que no
aporten al análisis. Si es necesario mostrar mucha información, considera
mostrar solo una muestra, los primeros datos, etc."

S6 (verbatim, rentabilidad): "La empresa que los contrató tiene un producto en
el mercado (renta de bicicletas, servicio de taxi, servicio de entrega de
comida) y está interesada en saber, con la información recolectada hasta el
momento, que modificación podría realizar al producto para mejorar la
rentabilidad."

S7 (AGENTS.md, por referencia): reporte ejecutivo para tomadores de decisión,
tope duro 8 pp (objetivo 5–6), dinámico (figuras/tablas dominan),
paleta retail nueva definida una vez, transformaciones documentadas
"antes → después", números por `r inline`, verificación de compilación.

S8 (decisión del usuario): conservar par de supervivencia
tiempo = `Last_Purchase_Days_Ago`, evento = `Target_Churn`; censura y
limitaciones documentadas explícitamente.

## Tasks

T1 (S7) — Auditoría del Rmd actual vs specs; inventario conservar/fusionar/eliminar; transformaciones a documentar. Ruta: inline. Commit: —
T2 (S2, S6) — Planteamiento ejecutivo: tienda en línea como producto; modificación para rentabilidad desde hallazgos. Ruta: inline. Commit: —
T3 (S7) — Paleta retail + helper tabla() con encabezado coloreado + ajustes de plantilla autorizados. Ruta: inline. Commit: —
T4 (S1, S4, S5, S7) — Recorte 25→≤8 pp: fusionar descriptivas en patchwork, captions decisionales, voz ejecutiva, r inline. Ruta: inline. Commit: —
T5 (S8, S7) — Supervivencia pulida: Surv documentado (censura/limitación), KM por segmentos, Cox en HR legible, PH comprimido. Ruta: inline (+verify condicional). Commit: —
T6 (S7) — Compilación: render limpio, sin Missing character, figuras completas y referenciadas, ≤8 pp. Ruta: inline. Commit: —
T7 (S1–S6) — Revisión: judgment-day (jd-judge-a/b, ≤2 rondas de fix) + asesor-reporte (co-editado con Tony antes de usarse). Ruta: subagents. Commit: —
T8 — Cierre: log final, resumen Engram, entrega. Ruta: inline. Commit: —

## Log

L1 (2026-11-10, solicitud original de Tony): "Como ya sabes, vamos a trabajar
en la Tarea Practica 5, ya tenemos una base de la que partir, realizada por
una companiera de equipo, pero se ha atascado y nos toca apoyarla." + plan ODD
aprobado con T1–T8 y revisión vía asesor-reporte + judgment-day sin modificar
la herramienta.

L2 (2026-11-10, decisión): par de supervivencia conservado
(Last_Purchase_Days_Ago + Target_Churn) con censura documentada.

L3 (2026-11-10): T6 cerrada — render limpio (7 pp, 0 Missing character, 0
overfull >20pt, 6 figuras completas y referenciadas, 0 salidas '##').
T7 bloqueada: todos los subagentes (jd-judge-a/b, gentle-ai-explore de sonda)
fallan con error (auth) del runtime; Judgment Day requiere re-autenticación.
Pendiente al volver: relanzar jueces A/B y co-editar asesor-reporte
(archivo completo propuesto mostrado a Tony).

L4 (2026-11-10): Judgment Day ronda 1 de 2 completa. Descubrimiento: dos
jueces ciegos independientes corroboran todos los números estadísticos del
reporte contra la base y acuerdan 3 severos congelados (JD-A-001 llaves {,}
literales BLOCKER; JD-B-002 backslashes en Nota técnica CRITICAL; JD-A-002
ritmo a mano con unidades erróneas CRITICAL) + 6 informativos. Fix aplicado
por jd-fix-agent (hash congelado b4bdb582...); re-juzgamiento: 3/3
'verified' por ambos jueces; verificación final: 7 pp, 0 {,}, 0 backslashes,
0 Missing character, 0 refs rotas. JUDGMENT: APPROVED (ronda 1 de 2; sin
escalamiento). Pendientes: 6 hallazgos informativos + reporte de
asesor-reporte (en curso) -> planteamiento de resolución por impacto.

L5 (2026-11-10): asesor-reporte (portado a Pi, glm5.3-flash) evaluó el PDF
corregido: 7/9 puntos ✅; ⚠️ solo en diseño de gráficas (eje x sin sentido en
Fig. 2) y en hipótesis H0/alternativa no redactadas; código y replicabilidad
✅. Sus hallazgos se consolidan con los 6 informativos del JD en un plan de
resolución por impacto (pendiente de aprobación de Tony).

L6 (2026-11-10): ciclo 2. asesor-reporte detecta bug introduced en el
re-escalado P3: ic_tbl <- exp(ci * escala) con ci ya exponenciado = doble
exp() -> Tabla 2 con IC invalidos ([2.703, 2.733] Edad; [Inf, Inf] en filas
escaladas), contradice el texto "todo intervalo contiene al 1.0". Fix
derivado (una linea): ic_tbl <- exp(confint(modelo_cox) * escala); IC
corregidos verificados en R read-only: todos contienen 1.0. Fix se aplica
via jd-fix-agent cuando los jueces A/B (en curso) congelen sus hallazgos.

L7 (2026-11-10): ciclo 2 completo. Descubrimiento: 1 BLOCKER congelado
(JD-A-001 doble exp() en IC de Tabla 2, corroborado por ambos jueces y el
asesor) + 4 informativos nuevos (JD-B-002 mediana interpretada de forma
engañosa x3, JD-A-002 risk table en inglés, JD-A-003/B-003 devoluciones
citadas sin figura, JD-B-004 semántica de color en Fig. 6, + Fig. 3 densa del
asesor). Fix ronda 1 de 2 (hash 0ce1cf73...): ic_tbl <- ci^escala; 12 IC
correctos, todos contienen 1.0, 0 Inf. Re-juzgamiento: verified por ambos.
Verificación final: 7 pp, 0 Inf, 0 Missing character, 0 refs rotas.
JUDGMENT: APPROVED (ciclo 2, ronda 1 de 2, sin escalamiento). Commit:
"Corrige doble exponenciacion en IC de la Tabla 2". Pendientes informativos
reportados a Tony con plan por impacto.

L8 (2026-11-10): ciclo 3 completo tras aplicar los 5 informativos (commit
1c1261b). Descubrimiento: CERO severos en ambos jueces — solo 1 WARNING
(etiqueta "All" en risk table) y SUGGESTION cosméticas (borde IC de Gasto
1.000 vs 0.9995 real, "día 180" literal, "Practica" sin tilde en portada,
verde de retención en "Canceló suscripción") + 3 de redacción del asesor
(caption Tabla 2 "incluye o roza al 1.0", "variables de experiencia",
"trimestral" como decisión). Verificación final: 7 pp, 0 Inf, 0 {,}, 0
Missing character, 0 refs rotas, 0 inglés en risk table (título). JUDGMENT:
APPROVED sin rondas de fix. Pendientes: micro-lote de redacción reportado a
Tony.

L9 (2026-11-10): ciclo 4 completo tras micro-lote (commit 9afc2ba).
Descubrimiento: CERO severos (jueces A/B) + asesor 7/7 ✅. Solo
informativos convergentes: IC de Gasto a 4 decimales, p=0.054 del caption
-> inline, "15 variables"/"10 numéricas" -> inline, outliers sin
Customer_ID, género en español (Fig. 1), glifo residual en risk table,
leyenda "Canceló suscripción" truncada, gradiente de Fig. 3 sin semántica
churn. Verificación final: 7 pp, 0 Inf, 0 Missing character, 0 refs rotas.
JUDGMENT: APPROVED sin fix rounds. Se aplica el pulido final consolidado.

L10 (2026-11-10): pulido final del ciclo 4 aplicado (commit 9ab11ab):
género en español (Fig. 1), IC a 4 decimales (Gasto [0.9995, 1.0639]),
p=0.054 inline en caption, n_duplicados/n_perdidos/num_vars inline
(num_vars_crudas capturado en lectura: ncol post-transformación da 19),
outliers sin columnas derivadas, gradiente Fig. 3 neutro, antigüedad
col_neutro, key residual de risk table eliminada (mutación de km_fig$table),
leyenda "Canceló suscripción" en 2 líneas. Verificación final: 7 pp, 0
Missing character, 0 refs rotas, 0 Strata/All/Number at risk, leyenda
completa. ENTREGA CERRADA: 7 commits, asesor 7/7 ✅, JD APPROVED 4 ciclos.

L11 (2026-11-10, corrección señalada por Tony): la reescritura había
reemplazado la función tabla() de la compañera por un helper simplificado —
sin column_spec (marco vertical), con longtable=FALSE, font_size 9 y colores
cambiados. Restaurado el diseño original completo (dos ramas, bordes
izq/der en primera y última columna, longtable, font_size 10) con dos
mejoras aditivas: colores como variables de la paleta y parámetro anchos.
Verificado en PDF: marco completo en Tablas 1 y 2. Pendientes aprobados en
espera: Fig. 2 opción A (caja neutra + puntos por estado), portada opción
2 (KPIs, mover escudo fuera del bloque navy) y tabla menta opcional.

L12 (2026-11-10, segunda corrección de tablas señalada por Tony): faltaba el
borde izquierdo y los separadores de columna en Tabla 1. Diagnóstico en el
.tex: kableExtra triplica la spec de longtable cuando column_spec aplica
bordes sobre anchos m{}/p{} (bug; el diseño original nunca lo sufría por
usar solo c), y también se triplica si el align lleva barras. Solución en
tabla(): construir la spec sin barras e inyectar el marco completo
(|m{1.8cm}|m{2.2cm}|p{9.4cm}| / |c|c|c|c|) directamente en la línea
begin{longtable}, más \endhead para repetir el encabezado en cada página de
la tabla partida. Verificado: marco completo en Tablas 1 y 2, encabezado
repetido, 7 pp, 0 errores LaTeX, 0 Missing character, 0 refs rotas.
Pendientes en cola: Fig. 2 opción A, portada opción 2, tabla menta.

L13 (2026-11-10, aprobación de Tony): aplicados los dos diseños elegidos.
Fig. 2 → opción A: caja blanca con contorno navy + geom_jitter coloreado por
estado (outlier.shape=NA, width 0.16, alpha 0.55), leyenda compartida con
plot_layout(guides="collect") en top, caption actualizado. Portada → opción
2: tikz overlay en preambulo.tex (\usepackage{tikz}, colores Port*),
bloque navy con pregunta de negocio, 4 KPIs (cifras manuales, nota de
sincronización en comentario), línea de decisión, \Autores y escudo en zona
blanca abajo-derecha; \clearpage retirado (duplicaba salto ya existente ->
página vacía). Verificado: 7 pp (portada + 6), 0 Missing character, 0 refs
rotas, 0 errores LaTeX; Fig. 2 estilo A y portada 2 confirmadas
visualmente. Pendiente opcional: tabla menta (no autorizada aún).

L14 (2026-11-10, petición de Tony): identidad Divvy — intro y planteamiento
sin "la empresa que nos contrató"/"tienda en línea"; \TituloTarea →
"Retención de clientes en Divvy" (portada + encabezados, 0 menciones de
"Tarea Práctica 5" en el PDF); línea de decisión partida en 2 líneas desde
":" y nodos de portada a 17.8cm (márgenes limpios). KPI 4 "segmentos con
señal" en revisión: alternativas presentadas a Tony (pendiente elección).

L15 (2026-11-10, decisión de Tony): retirado el 4º KPI "segmentos con
señal" de la portada — fila de 3 KPIs (1,000 · 52.6% · 269 días) en un solo
renglón, márgenes limpios. El mensaje "sin señal" permanece en el hallazgo
central y en la línea de decisión.

L16 (2026-11-10, decisión de Tony): sustituidos los anglicismos —
"re-engagement" → "recuperación de clientes" (intro, impl 1, portada) y
"re-instrumentación/re-instrumentar" → "rediseño del registro de datos /
mejorar el registro de datos" (intro, impl 3, portada). Tony editó a mano la
intro: "modificación a su servicio" (cambio ignorado por ahora, no
propagado, según su instrucción) y ajustó el espaciado de la línea de
decisión de la portada (\[-3mm], mantenido). 0 anglicismos en el PDF; 7 pp,
compilación limpia.

L17 (2026-11-10, decisión de Tony): opción 5 aplicada en los 3 lugares —
"ciclo de recuperación de clientes durante sus primeros 6 meses de
inactividad — antes del día 180 desde su última compra —". Los "6 meses"
salen de r inline (round(umbral_dias/30.4)); portada en un solo párrafo
envuelto por el nodo. Compilación limpia, 7 pp.

L18 (2026-11-10): prosa de limpieza simplificada (la Tabla 1 carga el
detalle; el texto da el veredicto: base limpia, nadie eliminado) + recortes
manuales de Tony integrados. Reporte de sus cambios manuales entregado.

L20 (2026-11-10): prosa del contraste por segmentos sin H0 en la línea
argumental — la prueba se declara en una nota técnica al pie (registro que ya
usaba la nota de cox.zph). Se corrigió "confirman la segunda pregunta" (error
de categoría) por "responden"; se quitó "estadísticamente detectable"; caption
de Fig. 6 a 3 decimales (consistente con el texto); pval = TRUE retirado de
ambos paneles (tercera copia del mismo número). Efecto lateral: 7 -> 8 pp
(dentro del tope duro, página final al ~40%); el párrafo acortado queda en p. 4
y Figura 6 en p. 7 — desplazamiento de flotantes que YA existía en el PDF
anterior (verificado contra HEAD), agravado por una página.
