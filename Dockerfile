FROM node:20-slim
WORKDIR /app
RUN npm install -g @outworked/antigravity
ENV PORT=3000
EXPOSE 3000
CMD ["antigravity", "start"]
