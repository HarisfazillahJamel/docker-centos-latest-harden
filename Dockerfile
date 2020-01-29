# https://hub.docker.com/_/centos
FROM centos:latest
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
# for openssh
RUN dnf -y install git shadow-utils sudo openssh-server
RUN mkdir /var/run/sshd
RUN ssh-keygen -A
RUN echo 'root:Xa0Iegh3' | chpasswd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
###RUN systemctl enable sshd; systemctl start sshd; systemctl status sshd
### still not work - System has not been booted with systemd as init system (PID 1). Can't operate.
RUN dnf -y upgrade; dnf -y autoremove; dnf clean all
# Add user1
RUN useradd user1 -m -s /bin/bash && \
    echo "Xa0Iegh3" > password.txt && \
    echo "user1:`cat password.txt`" | chpasswd && \
    usermod -a -G wheel user1 && \
    echo "### End Of add user1"

RUN echo "########################################" && \
    echo " " && \
    echo "PASSWORD For user1 is `cat password.txt`" && \
    echo " " && \
    echo "example to run :- " && \
    echo "docker pull linuxmalaysia/docker-centos-latest-harden" && \
    echo "docker run --privileged=true -it -d -P --name my_centos8 linuxmalaysia/docker-centos-latest-harden" && \
    echo " " && \
    echo "########################################" && \
    mkdir -p /home/user1/GITHUB && \
    chown user1:user1 /home/user1/GITHUB && \
    cd /home/user1/GITHUB && \
    git clone https://github.com/HarisfazillahJamel/docker-centos-latest-harden.git && \
    cd && \
    pwd

# Hardening Initialization and Startup Script
ADD hardening.sh /hardening.sh
RUN chmod 755 /hardening.sh
RUN /hardening.sh
EXPOSE 22
VOLUME ["/var/run/sshd"]
CMD ["/usr/sbin/sshd", "-D"]
