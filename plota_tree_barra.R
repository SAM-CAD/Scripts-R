# plota_tree_barra()

# SAM/CAD
# 28 05 2020
# joao carlos santiago

# falta adicionar parametros
# treemap:
# paleta de cores
# controle sobre fontes e títulos

# ggplot:
# controle sobre legendas, titulos de eixos
# fontes e paleta de cores
#


# requer
library(tidyverse)
library(rlang)
library(treemap)

plota_tree_barra <- function(df, 
                              var_corrente, 
                              varContagem,
                              horizontal=TRUE,
                              titulo="Título Padrão", 
                              lado_a_lado = FALSE)
{
  
  
  ptree <- treemap(df,
          index=var_corrente,
          vSize= varContagem, type="index", stdErr = NULL)
  
  tit_legenda = gsub("_", " ", var_corrente )
  
  pbarra <- ggplot(df, aes(x = !!sym(var_corrente), 
                      y= !!sym(varContagem), 
                      fill=!!sym(var_corrente))) +
    geom_col() + 
    labs(title= titulo, 
         subtitle= var_corrente, 
         x=var_corrente, 
         y= varContagem, 
         fill=tit_legenda) +
    theme(legend.position="bottom",
          plot.title = element_text(hjust=0.5),
          plot.subtitle = element_text(hjust=0.5)) 

  if( horizontal)
  {
    pbarra <- pbarra + coord_flip() 
  }
  
    print(ptree)
    
    print(pbarra)


}

# Fim plota_tree_barra()


