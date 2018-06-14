FROM loraneo/docker-os:7.3a

ENV JAVA_OPTS -Djava.net.preferIPv4Stack=true \
                 -XX:MaxRAMFraction=1 \
                 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
                 -Dfile.encoding=UTF-8 \
                 -Djsse.enableSNIExtension=true
             
ENV JAVA_OPTIONS ${JAVA_OPTS}

ENV DOWNLOAD_URL http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz

WORKDIR /opt

RUN set -e &&\
    curl -L -o jdk-8u171-linux-x64.tar.gz -k -v \
            --header "Cookie: oraclelicense=accept-securebackup-cookie" \
            $DOWNLOAD_URL &&\
    tar -zxf jdk-8u171-linux-x64.tar.gz &&\
    rm -f jdk-8u171-linux-x64.tar.gz &&\
    ln -s /opt/jdk* /opt/jdk


ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:/opt/jdk/bin
    
