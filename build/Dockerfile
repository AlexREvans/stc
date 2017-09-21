FROM ubuntu


RUN apt-get update -y
RUN apt-get install -y software-properties-common curl unzip


# Install JAVA
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle


# Install NODE 
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs


# Install STC
ADD ./Sencha*.zip /
RUN unzip Sencha*.zip -d /st
RUN printf '\n1\n\n/st\n2\n' | /st/SenchaTest*.sh
ENV PATH ${PATH}:/st/stc

ENTRYPOINT ["stc"]