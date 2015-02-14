FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive

# Install Oracle JDK
ADD oracle-license-selections /etc/debconf.d/
RUN debconf-set-selections /etc/debconf.d/orable-license-selections
ADD webupd8team-java.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && apt-get update && apt-get install -yq oracle-java7-installer --no-install-recommends


# Install Dependencies
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 ant maven curl --no-install-recommends
ENV GRADLE_URL=http://services.gradle.org/distributions/gradle-2.2.1-all.zip
RUN curl -L ${GRADLE_URL} -o /tmp/gradle-2.2.1-all.zip && unzip /tmp/gradle-2.2.1-all.zip -d /usr/local && rm /tmp/gradle-2.2.1-all.zip
ENV GRADLE_HOME /usr/local/gradle-2.2.1

# Download and untar Android SDK
ENV ANDROID_SDK_URL=http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
RUN curl -L ${ANDROID_SDK_URL} | tar xz -C /usr/local
ENV ANDROID_HOME=/usr/local/android-sdk-linux

# Install Android SDK components
ENV ANDROID_SDK_COMPONENTS=platform-tools,build-tools-21.1.2,android-21,extra-android-support
RUN echo y | ${ANDROID_HOME}/tools/android update sdk --no-ui --all --filter "${ANDROID_SDK_COMPONENTS}"

# Path
ENV PATH $PATH:${ANDROID_HOME}/tools:$ANDROID_HOME/platform-tools:${GRADLE_HOME}/bin