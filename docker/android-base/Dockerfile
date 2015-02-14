FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# Install Oracle JDK
ADD oracle-license-selections /etc/debconf.d/
RUN debconf-set-selections /etc/debconf.d/oracle-license-selections
ADD webupd8team-java.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && apt-get update && apt-get install -yq oracle-java7-installer --no-install-recommends

# Install Android SDK Dependencies
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 curl ca-certificates unzip --no-install-recommends

# Install Java build tools
ENV ANT_URL http://mirror.tcpdiag.net/apache//ant/binaries/apache-ant-1.9.4-bin.tar.gz
RUN curl -L ${ANT_URL} | tar xz -C /usr/local
ENV ANT_HOME /usr/local/apache-ant-1.9.4
ENV MAVEN_URL http://mirrors.ibiblio.org/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
RUN curl -L ${MAVEN_URL} | tar -xz -C /usr/local
ENV MAVEN_HOME /usr/local/apache-maven-3.1.1
ENV GRADLE_URL http://services.gradle.org/distributions/gradle-2.2.1-bin.zip
RUN curl -L ${GRADLE_URL} -o /tmp/gradle-2.2.1-bin.zip && unzip /tmp/gradle-2.2.1-bin.zip -d /usr/local && rm /tmp/gradle-2.2.1-bin.zip
ENV GRADLE_HOME /usr/local/gradle-2.2.1

# Download and untar Android SDK
ENV ANDROID_SDK_URL http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
RUN curl -L ${ANDROID_SDK_URL} | tar xz -C /usr/local
ENV ANDROID_HOME /usr/local/android-sdk-linux

# Install Android SDK components
ENV ANDROID_SDK_COMPONENTS platform-tools,build-tools-21.1.2,android-21,extra-android-support
RUN echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"

# Path
ENV PATH $PATH:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:${ANT_HOME}/bin:${MAVEN_HOME}/bin:${GRADLE_HOME}/bin