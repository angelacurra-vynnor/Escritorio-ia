FROM node:20-slim

# Instala o Git para permitir o download via repositório
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia os arquivos do seu repositório para o container
COPY . .

# Instala o motor dos agentes
RUN npm install -g https://github.com/outworked/antigravity.git

ENV PORT=3000
EXPOSE 3000
CMD ["antigravity", "start"]
