# Projeto Análise exploratória dos dados
# Fonte: https://www.kaggle.com/datasets/asaniczka/amazon-kindle-books-dataset-2023-130k-books/
# Acessado em: 07/11/2023

# Instalação dos pacotes que serão utilizados
install.packages("tidyverse")

# Carregamento dos dados
dados <- read.csv("kindle_data-v2.csv", sep=",")

# Contagem total de linhas e colunas
ncol(dados) # 16 colunas no total
nrow(dados) # 133.102 linhas no total
dim(dados) # ambos

# Visualizar as primeiras linhas do conjunto de dados
head(dados)

# Verificar dados ausentes
sum(is.na(data)) # Não foram identificados dados ausentes

# Identifica os tipos de dados de cada coluna
tipos_de_dados <- sapply(dados, class)

# Separação do conjuntos em variáveis qualitativas(character ou factor) e quantitativas (numeric ou integer)
dados_qualitativos <- dados[, tipos_de_dados %in% c("character", "factor")]
dados_quantitativos <- dados[, tipos_de_dados %in% c("numeric", "integer")]

# Resumo estatístico do conjunto de dados quantitativos
summary(dados_quantitativos)
