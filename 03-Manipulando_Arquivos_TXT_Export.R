# Trabalhando com Arquivos txt - Parte  2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap05")
getwd()

?read.table #ler arquivo
?write.table #gravar em arquivo

search()

# Gerando arquivo
write.table(mtcars, file = 'mtcars.txt')
dir()

df_mtcars <- read.table("mtcars.txt")
View(df_mtcars)
dim(df_mtcars)

# Posso mudar o separador de tab para pipe por exe.
# double identifica as aspas duplas
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

df_mtcars2 <- read.table("mtcars2.txt")
View(df_mtcars2)

# indicando o separador de colunas para read.table
df_mtcars2 <- read.table("mtcars2.txt", sep = '|')
View(df_mtcars2)

# agora indicando que possui cabeçalho
df_mtcars2 <- read.table("mtcars2.txt", sep = '|', header = TRUE, encoding = 'UTF-8')
View(df_mtcars2)

