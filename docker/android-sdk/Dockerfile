FROM java:openjdk-6-jdk

# install android tools deps:i386 and build tools
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 ant maven
RUN curl -L http://services.gradle.org/distributions/gradle-2.2.1-bin.zip -o /tmp/gradle-2.2.1-all.zip && unzip /tmp/gradle-2.2.1-all.zip -d /usr/local && rm /tmp/gradle-2.2.1-all.zip
ENV GRADLE_HOME /usr/local/gradle-2.2.1

# install android sdk tools
RUN curl -L http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz | tar xz -C /usr/local
# install sdk components
ENV ANDROID_HOME /usr/local/android-sdk-linux
RUN echo y | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter platform-tools,build-tools-21.1.2,android-21,extra-android-support,extra-google-google_play_services,extra-google-m2repository,extra-android-m2repository,source-21,addon-google_apis-google-21,sys-img-x86-addon-google_apis-google-21

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin
