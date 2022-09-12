FROM ubuntu:20.04 
ADD files/ /opt/astra/
ADD src/astra-mods /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install wget unzip 
CMD ["astra-mods"]
