FROM centos:latest

MAINTAINER Sriharsha Tikkireddy <tsriharsha@gmail.com>

RUN echo nameserver 8.8.8.8 >> /etc/resolv.conf

RUN echo nameserver 8.8.4.4 >> /etc/resolv.conf

RUN yum install -y epel-release tar which java golang make git python-devel && yum clean all

RUN cd /opt && \
    curl https://archive.apache.org/dist/zeppelin/zeppelin-0.7.2/zeppelin-0.7.2-bin-all.tgz | tar -zx && ln -s zeppelin-0.7.2-bin-all zeppelin

RUN yum install -y tkinter python-pip && yum clean all

RUN yum install -y nss_wrapper && yum clean all

RUN pip install matplotlib numpy

WORKDIR /opt/zeppelin

COPY launch.sh bin

RUN chmod a+rwX -R .

CMD ["/opt/zeppelin/bin/launch.sh"]
