FROM ghcr.io/f0rkz/docker-steamcmd:latest
ARG USERNAME=steam
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -yq && \
    apt install -y --no-install-recommends \
        libssl-dev \
        wget
RUN wget https://github.com/williambailey/go-envtmpl/releases/download/v0.3.0/envtmpl_0.3.0_linux_amd64.tar.gz -O /tmp/envtmpl.tar.gz
RUN tar zxfv /tmp/envtmpl.tar.gz -C /tmp --no-same-owner
RUN cp /tmp/envtmpl_0.3.0_linux_amd64/envtmpl /usr/local/bin && rm -rf /tmp/envtmpl*
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# ENTRYPOINT [ "/entrypoint.sh" ]
