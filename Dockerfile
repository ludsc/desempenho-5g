FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y gnupg curl apt-utils systemctl ca-certificates  \
    && apt-get install software-properties-common -y 

# Importando chave MongoDB
RUN curl -fsSL https://pgp.mongodb.com/server-8.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" \
    > /etc/apt/sources.list.d/mongodb-org-8.0.list && \
    apt update && \
    apt install -y mongodb-org

# Instalando Open5GS
RUN add-apt-repository ppa:open5gs/latest -y && \
    apt update && \
    apt install -y open5gs

# Instalando interface WEBUI
#RUN mkdir -p /etc/apt/keyrings && \
#    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
#    gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
#    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" \
#    > /etc/apt/sources.list.d/nodesource.list && \
#    apt update && \
 #   apt install -y nodejs && \
 #   curl -fsSL https://open5gs.org/open5gs/assets/webui/install | bash -

EXPOSE 8080

CMD ["sleep", "infinity"]