# 1. librerias ----------------------------------------------------------------------------------------------------

library(tidyverse)


# 2. importacion de los datos -------------------------------------------------------------------------------------

datos_raw <- read_csv(
  "Data/Afluencia_Metro_CDMX.csv",
  locale = locale(encoding = "UTF-8"),
  show_col_types = FALSE
)


# 3. limpieza -----------------------------------------------------------------------------------------------------

sospechosos <- datos_raw$estacion %>% as.factor() %>% levels() %>% .[grepl("Ã|Â|\uFFFD", .)]


arreglar_codif <- function(x) {
  y <- iconv(x, from = "UTF-8", to = "latin1")  # empaqueta los codepoints en los bytes originales
  Encoding(y) <- "UTF-8"                         # y los vuelve a leer como UTF-8
  y
}



datos_raw <- datos_raw %>% 
  mutate(
    fecha = as.Date(fecha),
    mes = as.character(mes),
    anio = as.integer(anio),
    linea = arreglar_codif(linea),
    linea = gsub("Linea",   "Línea", linea),
    estacion = arreglar_codif(estacion),
    tipo_pago = arreglar_codif(tipo_pago),
    afluencia = as.numeric(afluencia)
  )

# 4. seleccion de variables de interes ----------------------------------------------------------------------------

L12 <- "Línea 12"

datos <- datos_raw[datos_raw$linea == L12, c("fecha", "estacion", "tipo_pago", "afluencia")]

datos <- datos[datos$fecha < "2026-01-01", ]

# 5. almacenamiento en csv limpio ---------------------------------------------------------------------------------

write_csv(datos, "Data/Afluencia_L12_Metro_CDMX.csv")
