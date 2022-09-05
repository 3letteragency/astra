FROM nvidia/cuda:11.7.1-runtime-ubuntu20.04
ADD utils/ /usr/bin
ADD files/ /opt/astra
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && \
    apt -y upgrade && \
    apt install -y curl git wget zip tree htop tmux openssh-server rsync xpra && \
	mkdir -p /root/.ssh/ && \
	chmod 700 /root/.ssh/ && \
	touch /root/.ssh/authorized_keys && \
	chmod 600 /root/.ssh/authorized_keys && \
	rm -f /etc/ssh/sshd_config && \
	ln -s /opt/astra/sshd/sshd_config /etc/ssh/sshd_config && \
	chmod 0644 /etc/ssh/sshd_config
CMD [ "astra" ]
