FROM node:20-slim

# Instala o Git necessário para o npm baixar do GitHub
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copia o seu projeto do GitHub para dentro do container
COPY . .

# Instala o servidor do Antigravity direto da fonte
RUN npm install -g https://github.com/outworked/antigravity.git

ENV PORT=3000
EXPOSE 3000
CMD ["antigravity", "start"]
