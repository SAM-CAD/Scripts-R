# 
# Exemplos de uso da função abrevia
#

source("abrevia.R")

frase = "I can calculate the motion of heavenly bodies, but not the madness of people."

abrevia(frase)

abrevia(frase, minimo=3, tam=4, separador= " | ")

abrevia(frase, minimo=3, tam=4, separador= "")


frases = c("If I have seen further than others, it is by standing upon the shoulders of giants.",
"If I have done the public any service, it is due to my patient thought.",
"I can calculate the motion of heavenly bodies, but not the madness of people.")

lapply(frases, abrevia)

unlist(lapply(frases, abrevia))


