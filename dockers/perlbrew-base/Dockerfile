FROM ubuntu:18.04

MAINTAINER Mark A. Jensen <mark -dot- jensen -at- nih -dot- com>
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /opns

RUN apt update
RUN apt-get install --yes \
	perlbrew curl patch
RUN perlbrew self-upgrade
RUN echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.profile
RUN /bin/bash --login -c \
 	 'perlbrew install-cpanm ; \
          perlbrew install perl-5.24.4 ;'
ENTRYPOINT ["/bin/bash","--login"]



