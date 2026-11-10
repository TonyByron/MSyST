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
