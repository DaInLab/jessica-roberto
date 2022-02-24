## Carregando pacotes ##

if(!require(dplyr))
  install.packages("dplyr")
library(dplyr)

if(!require(psych))
  install.packages("psych")
library(psych)

# Instalando biblioteca readxl para importar para o R arquivos com extensão .xls ou .xlsx.
if (!("readxl") %in% installed.packages()) install.packages("readxl")

# Carregando a biblioteca
library(readxl)

# Importando o arquivo do exercício 1
df.ex2 <- read_excel("./dados/exercicio2.xls",skip = 1, col_names = "casas", col_types = c("numeric"))

## Visualizando os dados ##
View(df.ex2)
glimpse(dados)

### Tabelas de Frequências ###

### Frequência Absoluta ###
table(df.ex2$casas)

### Frequência Relativa ###

#Opção 1:#
prop.table(df.ex2$casas)

#Opção 2:#
Tab = table(df.ex2$casas) #salva a tabela em Casas
Total = sum(Tab) #soma os valores da tabela
Tab/Total #frequência absoluta dividido pelo total é igual à frequência 

## Frequência Contínua ##
categorizada <- cut(df.ex2$casas, breaks = c(1,25,50,75,100), 
                    labels = c("1-25","25-50","50-75","75-100"))

#Aplicando a tabela, temos:

table(categorizada)

