#########################################
# Basic Squid config with NCSA auth
# - default user/pass: user1 / password1
#########################################

FROM centos

MAINTAINER "supermasita"

ENV UPDATED "2019-02-15"

RUN yum install -y epel-release
RUN yum install -y supervisor squid
ADD squid.conf /etc/squid/
ADD passwords /etc/squid/
ADD supervisord.conf /etc/supervisor/conf.d/

# Create disk storage directory tree
RUN /usr/sbin/squid -Nz 

EXPOSE 3128

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
