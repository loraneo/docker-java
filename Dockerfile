FROM loraneo/docker-os:9.5a

ENV JAVA_OPTS -Djava.net.preferIPv4Stack=true \
                 -XX:MaxRAMFraction=1 \
                 -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
                 -Dfile.encoding=UTF-8 \
                 -Djsse.enableSNIExtension=true
             
ENV JAVA_OPTIONS ${JAVA_OPTS}

ENV DOWNLOAD_URL http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.tar.gz

WORKDIR /opt

RUN set -e &&\
    curl -L -o jdk-10-linux-x64.tar.gz -k -v \
            --header "Cookie: oraclelicense=accept-securebackup-cookie" \
            $DOWNLOAD_URL &&\
    tar -zxf jdk-10-linux-x64.tar.gz &&\
    rm -f jdk-10-linux-x64.tar.gz &&\
    ln -s /opt/jdk* /opt/jdk


ENV JAVA_HOME /opt/jdk
ENV PATH $PATH:/opt/jdk/bin
    
