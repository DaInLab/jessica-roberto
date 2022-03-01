###Exercicio 7###

# Instalando pacote#
install.packages("tidyverse")
install.packages("ggQC")

library("ggQC")
library("tidyverse")
library(readxl)

#Importando os dados#
df.ex7  <- read_excel("dados/exercicio7.xls")

#Grafico de Barras#
df.ex7 <- df.ex7 %>% rename(Areas=1,Atendimento=2)

ggplot(data = df.ex7) +
  geom_col(aes(y = Atendimento, x = Areas)) +
  ggtitle(paste("Frequência de Atendimento")) +
  theme(plot.title = element_text(hjust = 0.5))