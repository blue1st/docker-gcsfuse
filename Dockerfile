FROM debian:stretch-slim

RUN apt-get update && apt-get install -y curl fuse gnupg &&\
		echo "deb http://packages.cloud.google.com/apt gcsfuse-stretch main" | tee /etc/apt/sources.list.d/gcsfuse.list &&\
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - &&\
		apt-get update && apt-get install -y  gcsfuse

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
