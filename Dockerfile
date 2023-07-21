FROM nginx:1.25.0-alpine
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./build/web /usr/share/nginx/html
