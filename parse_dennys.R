library(tidyverse)

files = dir("data/dennys", full.names = TRUE)

res = list()
for (file in files) {
  res[[length(res)+1]] = list(
    location = basename(file)
  )
}

tibble(res = res) |>
  unnest_wider(res) |>
  write_rds("data/dennys.rds")
