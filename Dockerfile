FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

FROM deps AS build
COPY . .
RUN npm run build

FROM nginx:1.28.0-alpine AS production

# Создаём подкаталог kate и копируем туда сборку
RUN mkdir -p /usr/share/nginx/html/kate
COPY --from=build /app/dist/* /usr/share/nginx/html/kate/

# Копируем конфиг Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
