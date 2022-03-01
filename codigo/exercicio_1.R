##Instalando pacotes##
install.packages("tidyverse")

library("tidyverse")
library(readxl)

#Importando dados#
df.ex1 <- read_excel("dados/exercicio1.xls")

df.ex1 <- df.ex1 %>% rename(juros = "Taxas de juros")

#Calculos#
calculos <- summarise(df.ex1,
                      media=mean(juros),
                      mediana=median(juros),
                      variancia= var(juros),
                      desv_pad=sd(juros),
                      minimo=min(juros),
                      maximo=max(juros),
                      q1=quantile(juros, type=5, 0.25),
                      q3=quantile(juros, type=5, 0.75))

df.ex1 %>% ggplot( geom_bar(aes(x=juros)))

df.ex1 <- df.ex1  %>% mutate(df.ex1,
                             observacoes = c(1:10))

#Grafico media#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$media), colour="yellow")+
  ggtitle(paste("Média: ", calculos$media)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico mediana#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$mediana), colour="red")+
  ggtitle(paste("Mediana: ", calculos$mediana)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico desvio padrão#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_errorbar(aes(x = observacoes, ymin = juros - calculos$desv_pad, ymax = juros ), width = .2, colour="green")+
  ggtitle(paste("Desvio Padrão: ", calculos$desv_pad)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico Variancia#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_errorbar(aes(x = observacoes, ymin = juros - calculos$variancia, ymax = juros ), width = .2, colour="gold1")+
  ggtitle(paste("Variância: ", calculos$variancia)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico minimo#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$minimo), colour="blue")+
  ggtitle(paste("Mínimo: ", calculos$minimo)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico maximo#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$maximo), colour="purple")+
  ggtitle(paste("Máximo: ", calculos$maximo)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico q1#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$q1), colour="yellow")+
  ggtitle(paste("Quartil Q1: ", calculos$q1)) +
  theme(plot.title = element_text(hjust = 0.5))

#Grafico q3#
ggplot(data = df.ex1) +
  geom_col(aes(y = juros, x = observacoes)) +
  geom_line(aes(x = observacoes, y = calculos$q3), colour="orange")+
  ggtitle(paste("Quartil Q3: ", calculos$q3)) +
  theme(plot.title = element_text(hjust = 0.5))