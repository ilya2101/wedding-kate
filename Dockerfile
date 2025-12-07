FROM nginx:alpine

# Удаляем стандартный контент nginx
RUN rm -rf /usr/share/nginx/html/*

# Копируем сборку Vue из вложенной папки
COPY dist /usr/share/nginx/html/Wedding-with-Kate/

# Копируем конфиг nginx
COPY ../nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
