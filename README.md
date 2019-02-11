# ICDC model-tool-d

This is a wrapper around a Dockerized version of [`model-tool`](https://github.com/CBIIT/icdc-model-tools). It's intended to work exactly as if model-tool, will all its Perl and Graphviz dependencies, were installed on your system.


# Install

You need Docker installed on your machine. Recommend [Docker Desktop (Community Version)](https://www.docker.com/products/docker-desktop) for Win or MacOSX.

* Get a Docker Hub ID if you don't have one already. Just follow the sign-in/create account steps in the desktop app, or go to [https://hub.docker.com/](https://hub.docker.com/).

* Send me (@majensen) your Docker Hub ID, so I can add you to the docker repo (so the script will be able to pull the docker container)

* Clone this repo

        git clone https://github.com/CBIIT/icdc-model-tool-docker.git 

* Move to distribution directory

        cd icdc-model-tool-docker

* Easy build:

  * Get the "cpanminus" tool:

        curl -L https://cpanmin.us | perl - App::cpanminus     # or
        wget -O - https://cpanmin.us | perl - App::cpanminus

  * Run the following on cmd line; don't skip the tests

        perl Build.PL
        ./Build
		sudo ./Build installdeps --cpan_client cpanm
        ./Build test
        sudo ./Build install

  * Won't work until I add you to the Docker repo. Let me know on Slack if you have troubles.
