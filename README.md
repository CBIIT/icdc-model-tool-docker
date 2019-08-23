# ICDC model-tool-d

This is a wrapper around a Dockerized version of [`model-tool`](https://github.com/CBIIT/icdc-model-tools). It's intended to work exactly as if model-tool, will all its Perl and Graphviz dependencies, were installed on your system.

Note the script is called

     model-tool-d

with ``-d``.


# Install

You need Docker installed on your machine. Recommend [Docker Desktop (Community Version)](https://www.docker.com/products/docker-desktop) for Win or MacOSX.

* Get a Docker Hub ID if you don't have one already. Just follow the sign-in/create account steps in the desktop app, or go to [https://hub.docker.com/](https://hub.docker.com/).

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

  * Try it!

        $ model-tool-d # should output..

        FATAL: Nothing to do!
         (2019/08/23 21:57:59 in main::)
        Usage:
              model-tool [-g <graph-out-file>] [-s <output-dir>] [-j <json-out-file>] 
                         [-T <table-out-file>] <input.yaml> [<input2.yaml> ...]
                 [-d dir_to_search [-d another_dir...]]
              -g : create an SVG of model defined in input.yamls
              -T : output a table of nodes and properties
              -a : output all nodes, including unlinked nodes
              -v : verbosity (-v little ... -vvvv lots)
              -W : show all warnings ( = -vvv )
              --dry-run : emit log msg, but no output files



