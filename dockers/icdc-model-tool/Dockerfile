FROM maj1/icdc:graphviz-perlbrew

MAINTAINER Mark A. Jensen <mark -dot- jensen -at- nih -dot- com>
ARG perl=perl-5.24.4
ARG mtbranch=master
ARG model_tool_git=CBIIT/icdc-model-tool.git
ARG user_and_token=''

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /opns

RUN apt-get update
RUN apt-get install --yes git unzip gzip
RUN git clone https://${user_and_token}@github.com/${model_tool_git}
RUN /bin/bash --login -c \
 	'cd /opns/icdc-model-tools/make-model ; \
         perlbrew switch ${perl} ; \
         git checkout ${mtbranch} ; \
         perl Build.PL ; \
         ./Build ; \
         ./Build installdeps  --cpan_client "cpanm" ; \
         ./Build test ; \
         ./Build install ;' \

ENTRYPOINT ["/bin/bash","--login"]
