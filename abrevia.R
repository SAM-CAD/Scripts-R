# abrevia()

# SAM/CAD
# 28 05 2020
# joao carlos santiago



# abrevia
# recebe uma frase com palavras separadas por espaços
# remove palavras com menos do que "minimo" letras
# e extrai as primeiras "tam" letras desde o inicio de cada 
# palavra combinando em uma nova cadeia de caracteres separados
# pelo caracter "separador"

# Objetivo:  criar abreviaturas para nomes de categorias
# muito longos que nao permitem legendas de graficos e
# nomes de variaveis em eixos de graficos

# Exemplo:
# entrada
#             valores_categoria = c( "SERIADA DE DURAÇÃO INDETERMINADA",
#                                   "SERIADA EM MÚLTIPLAS TEMPORADAS",
#                                   "SERIADA EM TEMPORADA ÚNICA")  
#
#             lapply(valores_categoria, abrevia,2,3)
#
## saida 
#             [1] "SER_DUR_IND" "SER_MÚL_TEM" "SER_TEM_ÚNI"
# 

abrevia <- function(frase, minimo=2, tam=3, separador="_")
{
  frase = as.character(frase)
  
  z = unlist(strsplit(frase, split=" "))
  
  z = z[nchar(z)>=minimo]
  
  z = substring(z[nchar(z) > minimo],1,tam)
  
  unlist(paste0(z,collapse = separador))
}

# FIM abrevia()