# Testa abrevia_avalores()

###### PROGRAMA PRINCIPAL

library(tidyverse)
library(rlang)
library(treemap)
library(feather)
library(kableExtra)

# carrega a função
source("abrevia_valores.R")


#carrega a tabela de CPBs
cpbs <- read_feather("../repobackup-iMac/amostras/MV_CPB.feather")


# quais são as colunas do data.frame?
# colnames(cpbs)
# [1] "ID_OBRA"                        "NUMERO_CPB"                     "TITULO_ORIGINAL"               
# [4] "DATA_EMISSAO_CPB"               "SITUACAO_CPB"                   "NOME_REQUERENTE"               
# [7] "NUMERO_CPF_CNPJ_REQUERENTE"     "NUMERO_REGISTRO_REQUERENTE"     "REGIME_CO_PRODUCAO"            
# [10] "FOMENTO_DIRETO"                 "INVESTIMENTO_FSA"               "CONSTITUIDA_OBRAS_MENORES"     
# [13] "ORGANIZACAO_TEMPORAL"           "DURACAO_TOTAL_CPB"              "ANO_PRODUCAO"                  
# [16] "GENERO"                         "SUBGENERO"                      "FORMATO_PRIMEIRA_COPIA"        
# [19] "TRANSMISSAO_AO_VIVO"            "DATA_PRIMEIRA_TRANSMISSAO"      "SEG_MERCADO_INICIAL_PRETENDIDO"
# [22] "CLASSIFICACAO"

# quais são valores únicos do campo GENERO?
unique(cpbs$GENERO)
# [1] "FICC?O"                                          "DOCUMENTARIO"                                   
# [3] "ANIMAC?O"                                        "VARIEDADES"                                     
# [5] "REALITY-SHOW"                                    "N?O CLASSIFICADA"                               
# [7] "VIDEOMUSICAL"                                    "JORNALISTICA"                                   
# [9] "PROGRAMA DE AUDITORIO ANCORADO POR APRESENTADOR" "RELIGIOSA"                                      
# [11] "MANIFESTAC?ES E EVENTOS ESPORTIVOS" 

# existem 2 valores muito compridos para os graficos # [9] "PROGRAMA DE AUDITORIO ANCORADO POR APRESENTADOR"
# e "MANIFESTAC?ES E EVENTOS ESPORTIVOS" 

tmp = unique(cpbs$GENERO)

# qual desse valores tem mais do que 20 caracteres?
tmp[which(unlist(lapply(tmp, nchar)) > 20)]

# quantos registros existem nesse data frame para cada GENERO?

cpbs %>% group_by(GENERO) %>% summarise(nRegistros= n())

# # A tibble: 11 x 2
# GENERO                                          nRegistros
# <chr>                                                <int>
#   1 ANIMAC?O                                              2462
# 2 DOCUMENTARIO                                          9637
# 3 FICC?O                                               13487
# 4 JORNALISTICA                                           626
# 5 MANIFESTAC?ES E EVENTOS ESPORTIVOS                      21
# 6 N?O CLASSIFICADA                                      4089
# 7 PROGRAMA DE AUDITORIO ANCORADO POR APRESENTADOR        174
# 8 REALITY-SHOW                                           319
# 9 RELIGIOSA                                              214
# 10 VARIEDADES                                            1646
# 11 VIDEOMUSICAL                                          7968

# vamos abreviar entao?

df_abreviado <- abrevia_valores(cpbs, "GENERO")

# vamos testar o resultado

unique(df_abreviado$GENERO)

# [1] "FICC?O"              "DOCUMENTARIO"        "ANIMAC?O"            "VARIEDADES"         
# [5] "REALITY-SHOW"        "N?O CLASSIFICADA"    "VIDEOMUSICAL"        "JORNALISTICA"       
# [9] "PRO_AUD_ANC_POR_APR" "RELIGIOSA"           "MAN_EVE_ESP"   

# qual desse valores tem mais do que 20 caracteres?
tmp[which(unlist(lapply(unique(df_abreviado$GENERO), nchar)) > 20)]
   