#abrevia_valores

# essa função testa se na coluna "var_corrente" do data.frame "df"
# existem valores string que tenham um comprimento maior
# do que "lim_caracteres" e abrevia esse valores 
# usando a função abrevia

# essa rotina assume que o data frame é composto por um registro para cada
# entidade identificada pelo campo ID_OBRA 
# o que é horrive por sinal que identifica unicamente cada linha 
# do dataframe ... isso precisa de melhorias urgentes

# para generalizar precisamos assumer que o data frame tera um campo 
# "ID" qualquer que tambem passado como parametro

# observe que a rotina retorna o data.frame de entrada com os valores 
# abreviados mas imprime a tabela dos valores abreviados em formato tipico
# para RMarkDown .. isso tambem não é uma boa prática pois viola o principio
# do isolamento de funcionalidades .. a rotina faz varias coisas de niveis 
# diferentes .. abrevia .. assume coisas demais sobre os dados e ainda
# imprime e retorna valores ... 

# excelente exercicio de boas praticas de programacao melhorar esse rotina 

# ela tem que receber um data frame qualquer onde cada linha 
# tem um campo chave que é unico para cada registro
# e retornar o data.frame e alterado e o data.frame 
# com as legendas das abreviacoes e nao imprimir nada

# a funcao ou programa que chama abrevia valores é que 
# tratar o que fazer com o retorno dela

# outra coisa importante é que abrevia_valores precisa 
# receber parametros para serem 
# passados para a chamada de abrevia() dentro dela
# 

abrevia_valores <- function(df, var_corrente, lim_caracteres=20)
{
  valores = unique(df[,var_corrente])
  tamValores = apply(unique(df[,var_corrente]), 1, nchar)
  grandes = valores[ which(tamValores > lim_caracteres),]
  
  df_abreviados = data.frame()
  
  if( nrow(grandes)>0) 
  {
    # tabela de abreviacoes
    df_abreviados = cbind(var_corrente,grandes,apply(grandes,1,abrevia))
    colnames(df_abreviados) = c("Atributo", "Valor", "Valor Abreviado")
    
    t = df %>% filter( !!sym(var_corrente) %in% as.character(unlist(grandes[,1])))
    
    df[df$ID_OBRA %in% t$ID_OBRA, var_corrente] = apply(
      df[df$ID_OBRA %in% t$ID_OBRA, 
         var_corrente], 
      1, 
      abrevia)
    
    cat(paste("\n#### Valores abreviados", 
              var_corrente, "com mais de", 
              lim_caracteres, 
              "caracteres",
              "\n"))
    
    print(
      knitr::kable(as.data.frame(df_abreviados), format="html") %>% 
        kable_styling(bootstrap_options = "striped", full_width = F, position = "left",
                      font_size = 10)
    )
    cat("  \n")
  }
  #Fim da Abreviacao de Valores
  
  return(df)
}