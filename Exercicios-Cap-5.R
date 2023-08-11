# Solução Lista de Exercícios - Capítulo 5 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
?write.table
#ERREI, ACABEI COLOCANDO TRUE --- VERIF. O QUE TRUE SIGNIF. NESTE CASO, PQ FUNCIONOU
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")


# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

par(mfrow=c(1,1))
# Primeiro Histograma
hist(dataset1, breaks = 30, xlim = c(0, 300), col = "red", xlab = "Altura", ylab = "Peso", main = "", alpha = 0.5)

# Segundo Histograma sobreposto ao primeiro
hist(dataset2, breaks = 30, xlim = c(0, 300), col = "blue", xlab = "Altura", ylab = "Peso", main = "", alpha = 0.5, add = TRUE)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5)) #<- prof. solucionou assim
        #color = iris$Species , marker=list(size=20 , opacity=0.5)) <- MEU DEU CERTO ASSIM

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
View(volcano) #dataset contem informações sobre vulcoes
plot_ly(z=volcano, type='surface') #prof fez assim

# consegui ter o resultado de 2 formas:
x <- seq_len(nrow(volcano))
y <- seq_len(ncol(volcano))
plot_ly() %>% add_surface(x = ~x, y = ~y, z = ~volcano)

plot_ly(z = ~volcano) %>%
  add_surface() %>%
  layout(scene = list(camera=list(eye = list(x = .4, y = .68, z = 1.14))))

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
library(rjson)
resultado <- fromJSON(file = "input.json") #gera uma lista em R
print(resultado)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
# Carrega como dataframe
json_data_frame <- as.data.frame(resultado)
print(json_data_frame)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
library(XML)
library(methods) #faltou add este

resultadoXML <- xmlParse(file = "input.xml")
print(resultadoXML)

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
XML_data_frame <- xmlToDataFrame("input.xml")
print(XML_data_frame)

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
inputCSV <- read.csv("input.csv")
View(inputCSV)

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
dim(inputCSV) #posso usar o ncol e o nrow

# Pergunta 2 - Qual o maior salário?
salarioMaior <- max(inputCSV$salary)

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
filter(inputCSV, salary == salarioMaior)
#professor solucionou assim
Pessoa <- subset(inputCSV, salary == salarioMaior)
Pessoa

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
deptIT <- filter(inputCSV, dept == 'IT')
deptIT

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
filter(deptIT, salary > 600)
#prof solucionou assim
info <- subset(inputCSV, salary >500 & dept == 'IT')
info