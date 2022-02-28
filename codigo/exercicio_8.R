##Exercicio 8##

# Importando o arquivo do exercício 8
df.ex8 <- read_excel("./dados/exercicio8.xls",skip = 1, col_names = "Alturas", col_types = c("numeric"))

## Visualizando os dados ##
View(df.ex8)
glimpse(df.ex8)

##Construção do Histograma##

#Ordenação dos dados#
sort(df.ex8$Alturas)

#Amplitude#
range(df.ex8$Alturas)
AT<-ceiling(max(df.ex8$Alturas)- min(df.ex8$Alturas))
AT

#Número de classes#
k <- nclass.Sturges(df.ex8$Alturas)
k <- ceiling((sqrt(length(df.ex8$Alturas))))

#Tamanho da classe#
h <- ceiling(AT/k)
h

infclass <- min(df.ex8$Alturas)
supclass <- infclass+(k*h)

infclass
supclass

#Tabela de Distribuição de Frequências#
brk <-seq(infclass,supclass,h)
brk

#Absoluta#
TabelaDF_Alturas<-table(cut(df.ex8$Alturas,breaks = brk, right = FALSE))
TabelaDF_Alturas

#Relativa#
TabelaDFR_Alturas <- prop.table(TabelaDF_Alturas)
TabelaDFR_Alturas

#Histograma de Freq. Absoluta#
hist(df.ex8$Alturas,  
     main = "Altura dos Pacientes", 
     xlab = "Altura", ylab = "Freq. Absoluta", 
     col = c("red"), 
     border = c("royalblue"),
     breaks = brk,
     right = FALSE,
     axes = FALSE
)
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(TabelaDF_Alturas),2))

#Histograma de Freq. Relativa#
hfri<- hist(df.ex8$Alturas,breaks = brk,right = FALSE, plot = F)
hfri$counts <- hfri$counts / sum(hfri$counts)
plot(hfri, freq=TRUE, xlab = "Altura dos pacientes", ylab="Freq. Relativa", col = c("blue"), axes = FALSE) 
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(TabelaDFR_Alturas),0.05))

#Para comparação#
hist(df.ex8$Alturas)
