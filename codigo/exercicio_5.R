##Exercicio 5##

# Instalando pacote #
#install.packages("readxl")
#install.packages("tidyverse")
#install.packages("bbl")

# Carregando a biblioteca #
library("tidyverse")
library(readxl)

# Importando o arquivo do exercício 5#
df.ex5  <- read_excel("dados/exercicio5.xls")

#Gráfico de Barras#
df.ex5 <- df.ex5 %>% rename(Marca=1,N_pessoas=2)

ggplot(data = df.ex5) +
  geom_col(aes(x = Marca, y = N_pessoas)) +
  ggtitle(paste("Antitérmico Preferido")) +
  theme(plot.title = element_text(hjust = 0.5))

