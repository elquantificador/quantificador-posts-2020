# Reproduciendo los posts de El Quantificador (Marzo - Diciembre 2020)

Código y archivos RMarkdown para reproducir los artículos de El Quantificador del año 2020. Aquí podrás encontrar el código para replicar todos los artículos publicados durante 2020.

## Estructura del repositorio

La descripción de cada carpeta principal se encuentra en [docs/estructura.md](docs/estructura.md).
Para una versión en inglés puedes revisar [docs/structure.md](docs/structure.md).

## Ejecutar los análisis

1. Abra R o RStudio y asegúrese de tener instalado el paquete `rmarkdown`.
2. Instale las dependencias que aparecen en cada archivo. De forma general se utilizan paquetes como `tidyverse`, `readstata13`, `readxl`, `wbstats`, `rworldmap`, `rtweet`, `wordcloud`, `tmap` y `hrbrthemes`.
3. Sitúe su directorio de trabajo en la raíz del proyecto (donde está `elquantificador_posts.Rproj`).
4. Ejecute el RMarkdown deseado con `rmarkdown::render("ruta/al/archivo.Rmd")`. Los scripts `.R` pueden ejecutarse con `source("ruta/al/archivo.R")`.

### Datos necesarios

Las carpetas de cada artículo contienen los conjuntos de datos específicos que utilizan. Los archivos compartidos (por ejemplo ENEMDU o ENSANUT) están comprimidos en `databases/`. Varios RMarkdown descargan automáticamente información pública cuando es necesario.


## Licencias y cómo citar

- **Código:** [MIT](LICENSE).
- **Texto, figuras y tablas:** [CC BY-NC 4.0](LICENSE-content).
- **Datos de terceros:** conservan los términos de su fuente
  ([aviso](DATA-NOTICE.md)).
- **Nombre y logotipos:** todos los derechos reservados.

Las cifras y resultados pueden citarse libremente. Menciona a los autores y a
El Quantificador (LIDE) y enlaza la publicación original. Los usos comerciales
de gráficos, tablas o texto requieren autorización previa:
elquantificador@laboratoriolide.org. Ver también `CITATION.cff`.
