##Exercicio 5##

install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)
library(tidyverse) 

# Importando o arquivo do exercício 5#
df.ex5 <- read_excel("./dados/exercicio5.xls", sheet = "Plan1")
str(df.ex5)

## Visualizando os dados ##
View(df.ex5)
glimpse(df.ex5)

tabela <- table(df.ex5)
barplot(tabela,col="powderblue", main = "Antitérmico Preferido")

tabela <- table(df.ex5$Marcas)
barplot(tabela,col="powderblue", main = "Antitérmico Preferido")

##Gráfico de Barras##
ggplot(df.ex5$`N pessoas`, aes(y = Npessoas, x = Marcas)) +
  geom_bar(stat = "identity", fill = gray(.3)) +
  scale_y_continuous(limits = c(0,3.5), breaks = seq(0,3.5,.5)) +
  theme_classic(base_size = 18) +
  xlab("Marcas") + 
  ylab("Número de pessoas")


barplot(df.ex5, )

%>% 
  count(df.ex5)
  top_n(10, n) 
  ggplot() +
  geom_col(aes(x =marcas, y = pessoas))