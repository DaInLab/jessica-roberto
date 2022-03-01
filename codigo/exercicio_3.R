## Exercicio 3 ##

# Criando Tabela #

#criar variaveis#

Numero_de_filhos<-c(0,1,2,3,4,5,"Mais que 5") 
Familias<-c(17,20,28,19,7,4,5)

#criando data frame#

df.ex3<-data.frame(Número_de_filhos=Numero_de_filhos, Famílias=Familias)

df.ex3

View(df.ex3)

#Exportando em formato xls#
write.table(df.ex3, file = "exercicio3.csv", row.names = FALSE,
            sep = ";", dec = ",")

View(df.ex3)

#Mediana do Número de filhos#
ex3.mediana=median(df.ex3$Número_de_filhos)
print(paste("Mediana do Número de filhos:", ex3.mediana))

#Moda do Número de filhos#
ex3.moda=result <- subset (table (df.ex3$Número_de_filhos), table (df.ex3$Número_de_filhos) == max (table (df.ex3$Número_de_filhos)))
print(result)
  
#Outra forma de calcular a moda: table(df.ex3$Número_de_filhos)#

print(paste("Moda do Número de filhos:", result))

#Graficos#

#Mediana#
ggplot(data = df.ex3) +
  geom_col(aes(x = Numero_de_filhos, y = Familias)) +
  geom_line(aes(y = Familias, x = ex3.mediana), colour="green")+
  ggtitle(paste("Mediana: ", ex3.mediana, " filhos por familia")) +
  theme(plot.title = element_text(hjust = 0.5))

#Moda#
ggplot(data = df.ex3) +
  geom_col(aes(x = Numero_de_filhos, y = Familias)) +
  geom_line(aes(y = Familias, x = ex3.moda), colour="orange")+
  ggtitle(paste("Moda: ", ex3.moda, " filhos por familia")) +
  theme(plot.title = element_text(hjust = 0.5))

