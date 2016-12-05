#########################################
# Basic Squid config with NCSA auth
# - default user/pass: user1 / password1
#########################################

FROM centos

MAINTAINER "supermasita"

ENV UPDATED "2016-11-29"

RUN yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
RUN yum install -y supervisor squid
ADD squid.conf /etc/squid/
ADD passwords /etc/squid/
ADD supervisord.conf /etc/supervisor/conf.d/

# Create disk storage directory tree
RUN /usr/sbin/squid -Nz 

EXPOSE 3128

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
