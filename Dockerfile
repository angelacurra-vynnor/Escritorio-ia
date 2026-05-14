FROM node:20

WORKDIR /app

COPY agents/package*.json ./
RUN npm install

COPY agents/ .

EXPOSE 3000

CMD ["npm", "start"]
