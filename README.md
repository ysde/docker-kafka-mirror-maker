# Docker Kafka MirrorMaker
Docker container that runs Kafka's MirrorMaker.

Kafka Version: 0.9.0.1

## Building
* Modify the Dockerfile, change the KAFKA_RELEASE url to somewhere you can access the kafka tgz file.
* `docker build -t kafka-mirrormaker .`


## Usage
The container expects the following environment variables to be passed in:

* `CONSUMER_ZK_CONNECT` - Zookeeper connection string for source, including port and chroot.
* `DOWNSTREAM_BROKERS` - Brokers to receive mirrored messages
* `WHITE_LIST` - (optional) White list of topics, if used, do not use black list
* `BLACK_LIST` - (optional) Black list of topics, if used, do not use white list
* `CONSUMER_GROUP_ID` - (optional) Defaults to KafkaMirrorMaker\_YYYYMMDD_HHmmss (According to container system time)
* `PRODUCER_COUNT` - (optional) Defaults to 1
* `STREAM_COUNT` - (optional) Defaults to 1


### Command
`docker run --name kafka-mirror-maker -e WHITE_LIST="topic" -e CONSUMER_ZK_CONNECT=localhost:2181/chroot -e DOWNSTREAM_BROKERS=127.0.0.1:9092 kafka-mirrormaker`



## Note
Kafka mirror has version issue. You cannot use newer version to mirror older version. 

e.g. Use kafka\_0.10.0.1 to mirror kafka\_0.9.0.0 would have problem mirroring.

## MirrorMaker Documentation
https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=27846330
