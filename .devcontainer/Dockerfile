ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN apt update && apt upgrade -y
RUN apt install curl git

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | \
	sudo -E bash - && \
	apt install -y nodejs gnupg2

RUN corepack enable yarn && \
	corepack prepare yarn@stable --activate