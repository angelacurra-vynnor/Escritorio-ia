FROM node:20-slim

WORKDIR /app

COPY . .

RUN npm install -g https://github.com/outworked/antigravity.git

ENV PORT=3000

EXPOSE 3000

CMD ["antigravity", "start"]
