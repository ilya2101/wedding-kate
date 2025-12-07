# ============================ #
#           DEPS               #
# ============================ #
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

# ============================ #
#           BUILD              #
# ============================ #
FROM deps AS build
COPY . .
RUN npm run build

# ============================ #
#        PRODUCTION            #
# ============================ #
FROM nginx:1.28.0-alpine AS production

# Создаём подкаталог kate
RUN mkdir -p /usr/share/nginx/html/kate

# Копируем сборку в подкаталог kate
COPY --from=build /app/dist/* /usr/share/nginx/html/kate/

# Копируем конфиг Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
