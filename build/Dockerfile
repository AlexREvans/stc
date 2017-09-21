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


# Install CHROME

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -  && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update -y && \
    apt-get install -y google-chrome-stable


# Install STC
ADD ./Sencha*.zip /
RUN unzip Sencha*.zip -d /st
RUN printf '\n1\n\n/st\n2\n' | /st/SenchaTest*.sh
ENV PATH ${PATH}:/st/stc

# Frameworking to run sencha test in embedded browser
RUN mkdir /root/.sencha
RUN cp -r /st/selenium '/root/.sencha/'
RUN apt-get install -y libx11-6 libnss3 libgconf-2-4 libfontconfig1

RUN npm install -g selenium-standalone && \
    selenium-standalone install

CMD ["run", "-s",  "test/example", "-p",  "Headless"]
ENTRYPOINT ["selenium-standalone start && stc"]