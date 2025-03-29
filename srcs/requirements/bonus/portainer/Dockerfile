FROM alpine:3.20

WORKDIR /app

RUN apk update && \
    apk add --no-cache curl tar && \
    curl -L https://github.com/portainer/portainer/releases/download/2.27.3/portainer-2.27.3-linux-amd64.tar.gz -o portainer.tar.gz && \
    tar xzvf portainer.tar.gz --strip-components=1 -C /app && \
    rm -rf portainer.tar.gz && \
    chmod +x /app/portainer

EXPOSE 9443

VOLUME /var/run/docker.sock:/var/run/docker.sock

CMD ["/app/portainer", "-H", "unix:///var/run/docker.sock"]