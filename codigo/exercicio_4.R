##Exercicio 4##

# Importando o arquivo do exercício 4
df.ex4 <- read_excel("./dados/exercicio4.xls",skip = 1, col_names = "Salários", col_types = c("numeric"))

## Visualizando os dados ##
View(df.ex4)
glimpse(df.ex4)

##Construção do Histograma##

#Ordenação dos dados#
sort(df.ex4$Salários)

#Amplitude#
range(df.ex4$Salários)
AT<-ceiling(max(df.ex4$Salários)- min(df.ex4$Salários))
AT

#Número de classes#
k <- nclass.Sturges(df.ex4$Salários)
k <- ceiling((sqrt(length(df.ex4$Salários))))

#Tamanho da classe#
h <- ceiling(AT/k)
h

infclass <- min(df.ex4$Salários)
supclass <- infclass+(k*h)

infclass
supclass

#Tabela de Distribuição de Frequências#
brk <-seq(infclass,supclass,h)
brk

#Absoluta#
TabelaDF_Salários<-table(cut(df.ex4$Salários,breaks = brk, right = FALSE))
TabelaDF_Salários

#Relativa#
TabelaDFR_Salários <- prop.table(TabelaDF_Salários)
TabelaDFR_Salários

#Histograma de Freq. Absoluta#
hist(df.ex4$Salários,  
     main = "Histograma de Salários", 
     xlab = "Salários (X Salários Mínimos)", ylab = "Freq. Absoluta", 
     col = c("blue"), 
     border = c("royalblue"),
     breaks = brk,
     right = FALSE,
     axes = FALSE
)
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(TabelaDF_Salários),2))

#Histograma de Freq. Relativa#
hfri<- hist(df.ex4$Salários,breaks = brk,right = FALSE, plot = F)
hfri$counts <- hfri$counts / sum(hfri$counts)
plot(hfri, freq=TRUE, xlab = "Salários (X Salários Mínimos)", ylab="Freq. Relativa", col = c("blue"), axes = FALSE) 
axis(1, at=seq(infclass,supclass,h))
axis(2, at=seq(0,max(TabelaDFR_Salários),0.05))

#Para comparação#
hist(df.ex4$Salários)
