FROM ubuntu:latest

ARG CONTAINER_TIMEZONE=America/Denver
RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl make build-essential g++ git vim
RUN apt-get install -y python3 && ln -s /usr/bin/python3 /usr/bin/python
RUN groupadd backstage && useradd -s /usr/bin/bash -c 'Backstage runner' -g backstage backstage && mkdir -p /home/backstage && chown backstage:backstage /home/backstage && chmod 755 /home/backstage && mkdir /app && chown backstage:backstage /app && chmod 755 /app
USER backstage
# TODO:  Parameterize nvm version.
#ENV NVM_VERSION=0.40.0
ENV NVM_USE_VERSION=20
ENV NODE_VERSION=20.17.0
ENV NVM_DIR=/home/backstage/nvm
RUN mkdir -p $NVM_DIR && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NVM_USE_VERSION && nvm use $NVM_USE_VERSION"
# TODO:  $NODE_VERSION doesn't have major.minor.patch.
# TODO:  Parameterize versions of yarn & backstage, though these work!.
RUN /bin/bash -c "echo PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH >> /home/backstage/.bashrc"
RUN /bin/bash -c ". /home/backstage/.bashrc && npm install -g yarn && yarn config set python /usr/bin/python3" 
# TODO:  How do I run this unattended, and set a version of Backstage other than "latest"?  So, 1. assign an application name on the CLI, and 2. select version
#WORKDIR /app
#RUN npx -y @backstage/create-app@latest
EXPOSE 3000 7007
#ENTRYPOINT [/usr/bin/bash]
