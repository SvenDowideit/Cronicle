FROM node:latest

RUN apt-get update \
	&& apt-get install -yq jq \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /opt/Cronicle

COPY . /opt/Cronicle/
RUN npm install
RUN node bin/build.js dist

CMD ["/opt/Cronicle/bin/control.sh", "setup_and_start"]

EXPOSE 3012
VOLUME ["/opt/Cronicle/logs", "/opt/Cronicle/data"]
