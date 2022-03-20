##Exercicio 8##

##Instalando pacotes##
#install.packages("tidyverse")
#install.packages("ggQC")
#install.packages("bbl")

library("ggQC")
library("tidyverse")
library("bbl")
library(readxl)

#Importando dados do exercicio 8#
df.ex8  <- read_excel("dados/exercicio8.xls")

#Grafico#
df.ex8 <- as.data.frame(table(df.ex8))

df.ex8 <- df.ex8 %>% rename(Altura=1,Qtde_pacientes=2)

df.ex8 <- df.ex8  %>% mutate(df.ex8, observacoes = c(1:n()))


A <- freq2raw(data=df.ex8, freq= df.ex8$Qtde_pacientes)

ggplot(data = A) +
  geom_histogram(aes(x = Altura), stat="count") +
  ggtitle(paste("Histograma da altura dos pacientes")) +
  theme(plot.title = element_text(hjust = 0.5))