FROM taxistockholm/node-webpack:latest
WORKDIR /app

RUN apt-get update && apt-get install -y nginx
RUN sed -i 's/# server_tokens/charset utf-8; server_tokens/' /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY redirects.d /etc/nginx/
COPY default /etc/nginx/sites-enabled/

EXPOSE 80
CMD nginx
