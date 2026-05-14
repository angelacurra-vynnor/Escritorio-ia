FROM node:20-slim

RUN apt-get update && apt-get install -y git

WORKDIR /app

COPY . .

RUN npm install -g https://github.com/outworked/antigravity.git

ENV PORT=3000

EXPOSE 3000

CMD ["antigravity", "start"]
