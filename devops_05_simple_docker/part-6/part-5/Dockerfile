FROM nginx

WORKDIR /etc/nginx

RUN apt update -y && apt install gcc spawn-fcgi libfcgi-dev -y && \
  rm -rf /var/lib/apt/lists \
  chmod u-s /usr/bin/gpasswd \
  /usr/bin/newgrp \
  /bin/umount \
  /usr/bin/chfn \
  /bin/mount \
  /bin/su \
  /usr/bin/passwd \
  chmod g-s /usr/bin/chsh \
  /usr/bin/wall \
  /usr/bin/expiry \
  /sbin/unix_chkpwd \
  /usr/bin/chage 


COPY nginx.conf .

WORKDIR /app
COPY index.c .
COPY run.sh .

USER root

ENTRYPOINT ["bash", "run.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
