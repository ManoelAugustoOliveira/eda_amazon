# Projeto Análise exploratória dos dados
# Fonte: https://www.kaggle.com/datasets/asaniczka/amazon-kindle-books-dataset-2023-130k-books/
# Acessado em: 07/11/2023

# Instalação dos pacotes que serão utilizados
install.packages("tidyverse")

# Carregamento dos dados
dados <- read.csv("kindle_data-v2.csv", sep=",", na.strings = "")

# Contagem total de linhas e colunas
dim(dados) # 

# Visualizar as primeiras linhas do conjunto de dados
head(dados)

# Verificar dados ausentes
ausentes <- colSums(is.na(dados))
print(ausentes)

# Devido a grande quantidade de dados ausentes
# optou-se por exluir a coluna "publishedDate"
dados <- dados[,-15]

# as linhas com registros ausentes foram excluidas 
dados <- na.omit(dados)

# Transformação da coluna category_id em "character"
dados$category_id <- as.character(dados$category_id)

# Identifica os tipos de dados de cada coluna
tipos_de_dados <- sapply(dados, class)

# Separação do conjuntos em variáveis qualitativas(character ou factor) e quantitativas (numeric ou integer)
dados_qualitativos <- dados[, tipos_de_dados %in% c("character", "factor")]
dados_quantitativos <- dados[, tipos_de_dados %in% c("numeric", "integer")]

# Resumo estatístico do conjunto de dados quantitativos
summary(dados_quantitativos)

# Visualização dos dados
library(ggplot2)
library(dplyr)

################################################################################
isBestSeller <- ggplot(dados_qualitativos, aes(x = isBestSeller, fill = isBestSeller)) +
    geom_bar() +
    labs(title = "Total de Best Sellers (Sim ou Não) ?",
    x = "É Best Seller?",
    y = "Total") +
    theme_minimal() +
    theme(legend.position = "none")

isBestSeller

################################################################################
isKindleUnlimited <- ggplot(dados_qualitativos, aes(x = isKindleUnlimited, fill =isKindleUnlimited )) +
  geom_bar() +
  labs(title = "Total de Kindle Unlimited (Sim ou Não)?",
       x = "É Kindle Unlimited",
       y = "Contagem Total") +
       theme_minimal() +
       theme(legend.position = "none")

isKindleUnlimited

################################################################################
freqAbsolutaCategory <- as.data.frame(table(dados_qualitativos$category_name))
colnames(freqAbsolutaCategory) <- c("category_name", "total")

categoryName <- ggplot(freqAbsolutaCategory, aes(x = total, y = reorder(category_name, total))) +
    geom_col() +
    labs(title = "Total de livros por categoria",
         y = "Categoria") +
         theme_minimal()

categoryName

print(teste)
