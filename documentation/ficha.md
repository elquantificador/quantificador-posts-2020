# Ficha del artículo

Completa esta ficha al crear el repositorio y mantenla al día. Es el único
lugar con datos propios del artículo; el README es igual en todos los
repositorios.

## Identificación

- **Título:** Reproduciendo los posts de El Quantificador (Marzo - Diciembre 2020)
- **Autoría:** [COMPLETAR: nombres, igual que en el sitio]
- **Fecha de publicación:** [COMPLETAR: AAAA-MM-DD]
- **Artículo publicado:** [COMPLETAR: enlace a elquantificador.org]
- **Categoría:** [COMPLETAR: Economía, Política, Salud, Educación o Valores y
  comportamiento]
- **Edición:** [COMPLETAR: por ejemplo, Julio-Diciembre 2026]

## Estado

[COMPLETAR: en preparación, en revisión editorial o publicado. Anota qué falta
para cerrar el artículo.]

## Pregunta y alcance

[COMPLETAR: dos o tres oraciones con la pregunta, el periodo, la cobertura
geográfica y la unidad de análisis.]

## Requisitos

- R [COMPLETAR: versión, por ejemplo 4.5.x].
- Paquetes de R: [COMPLETAR: lista en orden alfabético].

## Fuentes de datos

| Fuente | Institución | Periodo | Acceso | Script |
|---|---|---|---|---|
| [COMPLETAR] | [COMPLETAR] | [COMPLETAR] | [COMPLETAR: descarga automática o manual] | `code/cleaning/00_download_fuente.R` |

Si alguna fuente no permite descarga automática, explica aquí cómo obtenerla y
dónde colocarla en `data/raw/`.

## Salidas

- `outputs/tables/[COMPLETAR].csv`: [COMPLETAR: qué contiene].
- `outputs/graphs/[COMPLETAR].png`: [COMPLETAR: qué muestra].
- `article/images/graficoN.png`: copias numeradas según el orden del texto.

## Cómo replicar en este repositorio

Este repositorio conserva sus instrucciones originales en la sección
"README anterior". Si todavía no tiene `MASTER.R`, sigue esas instrucciones.
Cuando se migre a la estructura estándar, reemplaza esta sección por los pasos
de `MASTER.R`.

## README anterior

Texto del README de este repositorio antes de adoptar el README estándar,
conservado sin cambios de contenido para no perder información.

### Reproduciendo los posts de El Quantificador (Marzo - Diciembre 2020)

Código y archivos RMarkdown para reproducir los artículos de El Quantificador del año 2020. Aquí podrás encontrar el código para replicar todos los artículos publicados durante 2020.

#### Estructura del repositorio

La descripción de cada carpeta principal se encuentra en [docs/estructura.md](docs/estructura.md).
Para una versión en inglés puedes revisar [docs/structure.md](docs/structure.md).

#### Ejecutar los análisis

1. Abra R o RStudio y asegúrese de tener instalado el paquete `rmarkdown`.
2. Instale las dependencias que aparecen en cada archivo. De forma general se utilizan paquetes como `tidyverse`, `readstata13`, `readxl`, `wbstats`, `rworldmap`, `rtweet`, `wordcloud`, `tmap` y `hrbrthemes`.
3. Sitúe su directorio de trabajo en la raíz del proyecto (donde está `elquantificador_posts.Rproj`).
4. Ejecute el RMarkdown deseado con `rmarkdown::render("ruta/al/archivo.Rmd")`. Los scripts `.R` pueden ejecutarse con `source("ruta/al/archivo.R")`.

##### Datos necesarios

Las carpetas de cada artículo contienen los conjuntos de datos específicos que utilizan. Los archivos compartidos (por ejemplo ENEMDU o ENSANUT) están comprimidos en `databases/`. Varios RMarkdown descargan automáticamente información pública cuando es necesario.
