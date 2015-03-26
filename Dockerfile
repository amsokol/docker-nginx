FROM oraclelinux:7.1
MAINTAINER Alexander Sokolovsky <amsokol@gmail.com>

# User root user to install software
USER root

#update system
RUN yum -y update && yum clean all

#configure yum repository for Oracle Linux (copy and install)
RUN yum -y install http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm && yum -y install nginx && yum clean all

VOLUME ["/etc/nginx/conf.d"]
VOLUME ["/var/cache/nginx"]
VOLUME ["/var/log/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
