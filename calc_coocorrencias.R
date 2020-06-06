

calc_coocorrencias <- function(df, coluna1, coluna2, sep=" ---- ")
{
  df = as.data.frame(df)
  
  co_ocorrencias <- as.data.frame.matrix(table(df[,coluna1], df[,coluna2]))
  
  # soma quantos 1 tem cada coluna
  # ou seja quantos atributos da coluna 2 tem 1s na mesma linha
  co_ocorrencias$soma <- apply(co_ocorrencias,1,sum)
  
  # so me interessa os com soma > 1 
  # coproducoes, co-atividades etc 
  coprod <- co_ocorrencias[which(co_ocorrencias$soma > 1),]
  
  # agora vamos remover em cada linha as colunas
  # com zeros
  
  colunas = names(coprod)[1:(ncol(coprod)-1)]
  
  df=data.frame()
  for ( i in 1:nrow(coprod))
  {
    # pega uma linha
    v <- coprod[i, colunas]
    
    # testa quais colunas sao != 0
    mask = sapply(v, function(col) col!=0)
    
    # cria uma string com o nome das empresas que co produziram
    empresas = as.data.frame(paste(names(v[, mask, drop=F]), collapse = sep))
    colnames(empresas) = "empresas"
    
    # junta tudo
    df = rbind(df, empresas )
    
  }
  
  return(list(df, co_ocorrencias))
}