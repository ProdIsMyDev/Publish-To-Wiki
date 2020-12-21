FROM ubuntu

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

ENTRYPOINT ["/entrypoint.sh"]
