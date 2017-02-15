FROM centos:latest

MAINTAINER Chad Roberts <croberts@redhat.com>

RUN yum install -y epel-release tar java && \
    yum clean all

RUN yum install -y nss_wrapper && yum clean all

RUN cd /opt && \
    curl https://archive.apache.org/dist/zeppelin/zeppelin-0.7.0/zeppelin-0.7.0-bin-all.tgz | \
       tar -zx && \
    ln -s zeppelin-0.7.0-bin-all zeppelin

WORKDIR /opt/zeppelin

COPY launch.sh bin

RUN chmod a+rwX -R .

CMD ["/opt/zeppelin/bin/launch.sh"]
