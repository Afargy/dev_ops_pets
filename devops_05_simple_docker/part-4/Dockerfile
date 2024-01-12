

FROM nginx

WORKDIR /etc/nginx

RUN apt update -y && apt install gcc spawn-fcgi libfcgi-dev -y 

COPY . .

ENTRYPOINT ["bash", "run.sh"]
