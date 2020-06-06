# requer openxlsx
library(openxlsx)

source("salva_xlsx.R")

# nome das abas
listaAbas = c("aba1", "aba2")

# nome dos data frames
listaDFs = c("iris", "mtcars")

nome_arquivo = "planilha_teste.xlsx"

salva_xlsx(listaDFs, listaAbas, nome_arquivo )