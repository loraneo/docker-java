FROM loraneo/docker-os:7.3a

ENV JAVA_OPTS -Djava.net.preferIPv4Stack=true \
             -Djava.security.egd=file:/dev/urandom \
             -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
             
ENV JAVA_OPTIONS ${JAVA_OPTS}

ENV DOWNLOAD_URL http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm	

RUN curl  -vjkLH "Cookie: oraclelicense=accept-securebackup-cookie" $DOWNLOAD_URL > jdk-8.rpm  || exit 1 \
	&& yum -y localinstall jdk-8.rpm || exit 1 \
	&& rm jdk-8.rpm


ENV JAVA_HOME  /usr/java/latest 
ENV PATH $PATH:/usr/bin/java

	