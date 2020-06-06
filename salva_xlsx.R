# salva_xlsx()

# SAM/CAD
# 28 05 2020
# joao carlos santiago


# requer openxlsx
library(openxlsx)

# Grava uma lista de data.frames por meio dos seus nomes
# na forma de strings em uma planilha via
# o pacote openxlsx

# ldfs  = vetor caracter com o nome dos data frames
# labas = vetor character com nome das abas

salva_xlsx <- function(ldfs, labas, arquivo)
{
  # cria a planilha
  wb <- createWorkbook()
  
  # todas as abas
  for ( i in 1: length(labas))
  {
    ## adiciona as abas
    addWorksheet(wb, labas[i])
  }
  
  # data frames nas abas
  for ( i in 1: length(ldfs))
  {
    df = as.data.frame(ldfs[[i]])

    writeData(wb, labas[i] , df , rowNames = FALSE)
  }
  
  saveWorkbook(wb, arquivo, overwrite = TRUE)
}

# FIM abrevia()
