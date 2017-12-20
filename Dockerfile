FROM debian:latest

RUN apt-get update && apt-get install -y curl fuse sudo lsb-release gnupg &&\
		export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` &&\
		echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list &&\
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - &&\
		apt-get update && apt-get install -y  gcsfuse

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
