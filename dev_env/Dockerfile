FROM alpine:latest AS local
RUN apk update && apk upgrade

RUN apk add --update nodejs nodejs-npm

RUN apk add zsh \
    git \
    curl \
    python3 \
    py-pip \
    neovim=0.4.4-r0
ENTRYPOINT ["/bin/zsh"]

