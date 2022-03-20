###Exercicio 6###

##Instalando de pacotes##
#install.packages("tidyverse")
#install.packages("ggQC")

library("ggQC")
library("tidyverse")
library(readxl)

# Importando o arquivo do exercício 6#
df.ex6  <- read_excel("dados/exercicio6.xls")

df.ex6 <- df.ex6 %>% rename(Qualidade=1,Qtde_pessoas=2)

ggplot(data = df.ex6, aes(x = Qualidade, y = Qtde_pessoas)) +
  stat_pareto(point.color = "yellow",
              point.size = 3,
              line.color = "black",
              bars.fill = c("red","purple")) +
  ggtitle(paste("Classificação de atendimento")) +
  theme(plot.title = element_text(hjust = 0.5))