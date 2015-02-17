FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -yq x11vnc xserver-xorg-video-dummy git net-tools ca-certificates python websockify python-pkg-resources

RUN git clone https://github.com/kanaka/noVNC.git /usr/local/novnc

COPY xorg.conf /etc/X11/xorg.conf
COPY novnc /usr/local/bin/

VOLUME /tmp/.X11-unix/

EXPOSE 6080
ENTRYPOINT novnc
