# AGENTS.md — Tarea Práctica 5 (Modelos de supervivencia)

## Contexto del proyecto

Análisis de supervivencia sobre retención de clientes de una tienda en línea
(`Data/online_retail_customer_churn.csv`, 15 variables; diccionario en
`Data/Descripción.txt`). Entregable: reporte PDF ejecutivo generado desde un
único Rmd (`Tarea_Practica_5.Rmd`). Idioma del reporte: español. Código y
comentarios: español (convención del proyecto).

## Tono y audiencia del reporte

El destinatario es quien **toma decisiones** del negocio, no un lector
académico ni un revisor de teoría. Consecuencias para todo el documento:

- Primero el hallazgo y su decisión sugerida; la justificación estadística va
  después y comprimida. Cada sección abre con una o dos frases de "qué implica
  esto para el negocio".
- Las notas técnicas (supuestos, pruebas, parámetros de modelos) son breves,
  van a pie de sección o en nota al margen, y **no absorben la atención
  visual**: sin párrafos largos de teoría, sin derivaciones. Quien domina el
  tema debe poder verificar el detalle en un vistazo; quien no lo domina debe
  poder leer el reporte completo sin tropezar con él.
- Voz ejecutiva: "los clientes con más de 3 contactos a soporte tienen una
  retención X% menor", no "se estimó un coeficiente de ..." salvo que el
  coeficiente sea la decisión.

## Extensión y ritmo

- Tope duro: **8 páginas**. El objetivo de trabajo es el mínimo que sostenga
  el análisis (referencia: 5–6); el tope es una cota, no una meta — no se
  rellena para llegar. Si el contenido excede 8, se recorta texto, no figuras.
- El reporte debe mantenerse **dinámico**: gráficas y tablas dominan sobre
  bloques de prosa; ningún bloque de texto supera ~1 columna sin apoyo visual.
- Referencia de extensión y diseño: `../Tarea_practica_1/` (misma plantilla,
  mismo pipeline). El ritmo de esa tarea funcionó bien; la única deducción fue
  **no reportar con claridad las transformaciones aplicadas a la serie**.
  Precaución equivalente aquí: cada transformación o decisión de limpieza
  (truncado de extremos, imputación, recodificación, creación del tiempo de
  supervivencia y del evento) se documenta explícitamente en su sección, con
  "antes → después" o tabla resumen comprimida.

## Plantilla y formato

- La plantilla (`plantilla/preambulo.tex`, `Tony.sty`) **puede modificarse a
  discreción de Tony**: paleta de colores, portada y márgenes/formato de
  página son ajustables sin necesidad de pedir permiso. Solo debe mantenerse
  el pipeline de compilación (xelatex + bookdown + `.Renviron` TEXINPUTS).
- Cualquier cambio de estilo se hace en la plantilla o en el chunk de helpers,
  nunca a mano gráfica por gráfica.

## Estructura del proyecto

```
Data/                        # datos crudos; NO se modifican
plantilla/                   # preambulo.tex, Tony.sty, varios.sty, escudo — editable a discreción (ver arriba)
Tarea_Practica_5.Rmd         # TODO el análisis vive aquí (un solo documento)
Tarea_Practica_5.Rproj
.Renviron                    # TEXINPUTS=./plantilla// — requerido para compilar
```

No crear scripts `.R` sueltos ni notebooks paralelos: todo chunk pertenece al Rmd.

## YAML (fijo, no tocar salvo acuerdo explícito)

`bookdown::pdf_document2` + `xelatex` + `keep_tex: true`, encabezado
`plantilla/preambulo.tex`. bookdown da numeración y `\ref` de figuras/tablas:
toda figura y tabla citada en el texto debe referenciarse con
`Figura \@ref(fig:...)` / `Tabla \@ref(tab:...)`, nunca "la figura de abajo".

## Esqueleto del Rmd

1. **Chunk `setup`** (include=FALSE): `rm(list = ls(all.names = TRUE))`,
   `gc()`, `set.seed(123)` y `knitr::opts_chunk$set(echo=FALSE,
   message=FALSE, warning=FALSE, fig.align="center")`. No repetir esto en
   otros chunks.
2. **Chunk `paquetes`**: todos los `library()` en un solo chunk, uno por
   línea, con comentario de por qué se usa cada paquete. Registrar conflictos
   conocidos (MASS tapa `dplyr::select`; VGAM tapa `lmtest::lrtest` → usar
   `dplyr::select()`, `lmtest::lrtest()` explícitos).
3. **Chunks de helpers** (funciones/tablas, paleta, include=FALSE) antes del
   contenido.
4. **Secciones**: Introducción → Planteamiento del problema y propuesta →
   Exploración/descripción de la base → Limpieza (duplicados, perdidos,
   categóricas, extremos) → Descriptiva → Análisis de supervivencia →
   Conclusiones. Sin código repetitivo en la salida (`echo=FALSE`; código
   comentado solo en apéndice si hace falta retroalimentación).

## Convenciones de chunks

- Nombre descriptivo en snake_case: `limpieza-nulos`, `km-por-genero`, etc.
- Todo chunk con figura lleva `label=` único y `fig.cap=` (texto en español,
  informativo; el caption no sustituye la referencia en el texto).
- Cada chunk inicia con un banner de comentario de una línea:
  `# Tema del chunk =================================================================`
- Formato de números: usar `formatC(x, format="f", digits=n, big.mark="{,}")`
  (o `scales::label_number` en gráficas). NO usar la función `nm()` de la
  plantilla de tareas anteriores: tiene bugs verificados (negativos y acarreo
  de redondeo).
- Todo número que aparezca en el texto sale de ``r inline code`` con la
  variable ya calculada en un chunk anterior; números "a mano" prohibidos.

## Gráficas

- ggplot2; siempre título, etiquetas de ejes con unidades, y tema consistente
  (`theme_minimal(base_size = 10)`, convención de Tarea_Practica_1).
- Tamaños: `fig.width=6, fig.height=3` por defecto; ajustar solo si el
  gráfico lo pide. Composición con patchwork.
- Las gráficas deben aparecer completas en el PDF (verificar tras compilar).

## Diseño y paleta

- La paleta NO se reutiliza de la Tarea 1 (línea dorada del Metro L12): aquí
  debe ser más llamativa y acoplada al contexto de **retail en línea /
  retención de clientes**. Se define una sola vez en un chunk de helpers como
  vector con nombre (`colores_riesgo`, `colores_churn`, ...), con semántica
  estable en todo el reporte (p. ej. rojo = fuga, verde = retención, un
  acento vivo para destacar hallazgos). Nada de colores por gráfica ad hoc;
  la elección concreta es editable vía plantilla.
- Gráficas "decisionales": si una gráfica existe para justificar una acción,
  su caption dice la acción. Segmentos de clientes con colores consistentes
  entre gráficas.
- Tablas: encabezado con fondo de color y texto blanco
  (`kableExtra::row_spec`) consistente con la paleta; números formateados con
  `formatC`/`scales`. Usar el helper `tabla()` existente (o función análoga)
  con `caption=`; nunca tablas pegadas como salida cruda de R.

## Datos

- El CSV se lee una sola vez desde `Data/`; ninguna celda del CSV se edita.
- Transformaciones y limpieza son reproducibles: dependen solo del CSV y la
  semilla, nunca de un estado manual de la sesión.

## Compilación y verificación (antes de dar por terminado un cambio)

1. `rmarkdown::render("Tarea_Practica_5.Rmd")` sin errores.
2. Revisar el `.log`/`.tex` por "Missing character" y overfull severos.
3. Confirmar: todas las figuras aparecen y están referenciadas; no hay
   salidas de código repetitivas ni `##` de consola visibles; el total no
   rebasa el tope de páginas.
