FROM maj1/dayjob:perlbrew-base

MAINTAINER Mark A. Jensen <mark -dot- jensen -at- nih -dot- com>
ARG perl=perl-5.24.4
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /opns

RUN apt update
RUN apt-get install --yes \
	graphviz
RUN /bin/bash --login -c \
         'perlbrew switch ${perl} ; \ 
          cpanm GraphViz2 ; '
ENTRYPOINT ["/bin/bash","--login"]
