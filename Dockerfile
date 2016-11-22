FROM anapsix/alpine-java

# Cannot use newer verison of Kafka as mirro maker to older version of Kafka
# 0.9.0.1 has been tested with 0.10.0.1 -> 0.10.0.1

ENV KAFKA_RELEASE="http://apache.stu.edu.tw/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz"
ENV KAFKA_FILE="/tmp/kafka.tar.gz"

RUN mkdir -p /tmp/kafka && \
    wget $KAFKA_RELEASE -O /tmp/kafka.tar.gz && \
    gunzip < $KAFKA_FILE | tar -C /tmp/kafka -xvf - && \
    mv /tmp/kafka/* /opt/kafka && \
    ls /opt/kafka/bin

USER root

ADD scripts/start_mirror_maker.sh start_mirror_maker.sh

ENTRYPOINT ["/bin/bash", "-ex", "./start_mirror_maker.sh"]
