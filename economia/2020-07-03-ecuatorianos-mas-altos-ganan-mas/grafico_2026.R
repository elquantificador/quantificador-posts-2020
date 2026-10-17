# Yes. Use a PNG/JPG from disk as a watermark with ggplot2 + png/jpeg + grid.
# Example assumes you have a logo file at `logo_path`.

if (!require(png)) install.packages("png", repos = "https://cloud.r-project.org")
if (!require(jpeg)) install.packages("jpeg", repos = "https://cloud.r-project.org")
if (!require(grid)) install.packages("grid", repos = "https://cloud.r-project.org")
if (!require(cowplot)) install.packages("cowplot", repos = "https://cloud.r-project.org")
library(cowplot)

library(png)
library(jpeg)
library(grid)
library(ggplot2)
library(cowplot)

# Ruta relativa a la raiz del repositorio (directorio de trabajo, ver README)
logo_path <- "economia/2020-07-03-ecuatorianos-mas-altos-ganan-mas/quantificador.png"

# 1) Fit regressions by sexo and build equation labels (NO "log(ingreso) =" text)
coefs <- df %>%
  group_by(sexo) %>%
  do({
    m <- lm(linc ~ estatura, data = .)
    tibble(
      a = unname(coef(m)[1]),
      b = unname(coef(m)[2])
    )
  }) %>%
  ungroup() %>%
  mutate(eq = sprintf("y = %.3f + %.3f·x", a, b))

# 2) Annotation positions (fixed coordinates)
ann <- coefs %>%
  arrange(sexo) %>%
  mutate(
    x = 170,
    y = case_when(
      row_number() == 1 ~ 6.4,
      row_number() == 2 ~ 6.0,
      TRUE ~ 6.0
    )
  )
# Wrap caption + smaller title/subtitle (and keep stable logo placement)
library(stringr)

caption_txt  <- "Fuente: ENSANUT 2018. Cálculos por el autor. Se considera individuos mestizos entre 40 y 50 años."

subtitle_txt <- "Un aumento de 1 cm se relaciona con aproximadamente 3% más ingresos para mujeres y 2% más para hombres"

p_base <- ggplot(df, aes(x = estatura, y = linc, color = sexo, linetype = sexo)) +
  geom_point(alpha = 0.25, size = 0.9, show.legend = FALSE) +   # scatter
  geom_smooth(method = "lm", se = FALSE, linewidth = 1.1) +
  theme_classic() +
  labs(
    x = "Estatura (cm)",
    y = "Ingresos laborales (en logaritmo)",
    title = "\u00BFLos ecuatorianos más altos ganan más?",
    subtitle = str_wrap(subtitle_txt, width = 55),
    caption = paste0("\n", str_wrap(caption_txt, width = 55)),
    color = "Sexo",
    linetype = "Sexo"
  ) +
  theme(
    plot.title    = element_text(colour = "grey20", size = 12, face = "bold", hjust = 0),
    plot.subtitle = element_text(colour = "grey30", size = 9, lineheight = 1.1, hjust = 0),
    plot.caption  = element_text(colour = "grey30", size = 8, lineheight = 1.1, hjust = 0.15),
    axis.line     = element_line(colour = "grey60"),
    legend.position = "bottom",
    plot.margin = margin(12, 16, 16, 16),
    plot.title.position = "plot"
  )

# Move logo up (increase y)
p1 <- ggdraw() +
  draw_plot(p_base, x = 0, y = 0, width = 1, height = 1) +
  draw_image(
    logo_path,
    x = 0.86, y = 0.09,     # moved up
    width = 0.10, height = 0.10
  )

p1

ggsave(
  filename = "economia/2020-07-03-ecuatorianos-mas-altos-ganan-mas/grafico_2026_instagram_1080x1350.png",
  plot = p1,
  width = 4, height = 5, units = "in",
  dpi = 270
)