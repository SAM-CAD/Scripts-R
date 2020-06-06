###### PROGRAMA PRINCIPAL

library(tidyverse)
library(rlang)
library(treemap)

# carrega a função
source("plota_tree_barra.R")

# um data frame de categorias como exemplo
library(vcd)
## Load Arthritis dataset (data frame)
data(Arthritis)

# colnames(Arthritis)
# "ID"        "Treatment" "Sex"       "Age"       "Improved"

#colunas de interesse
colunas =  c( "Treatment", "Sex"  , "Improved" )

var_contagem = "nObjetos"

for ( i in 1:length(colunas))
{
  cat("  \n## Gráfico Distribuiçao", colunas[i],  "  \n")
  
  var_corrente = colunas[i]
  
  exp = parse_expr( paste0( var_contagem, "= n()"))
  
  df  <- Arthritis %>%
         group_by(!!sym(var_corrente)) %>%
         summarise(!!exp)
  
  colnames(df)[2] = var_contagem
  
  # chama plota_tree_barra
  plota_tree_barra(df, 
                        var_corrente, 
                        var_contagem, 
                        titulo = "Titulo Qualquer",
                        lado_a_lado = TRUE)
  
  cat("  \n")
  
}

