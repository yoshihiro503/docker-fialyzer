FROM ocaml/opam2:4.07

RUN sudo apt-get update
RUN sudo apt-get install -y libgmp-dev perl pkg-config m4 zlib1g-dev

RUN git clone https://github.com/dwango/fialyzer.git

WORKDIR fialyzer
RUN opam update
RUN opam pin add -y fialyzer .
RUN eval $(opam env) && make

RUN mkdir /home/opam/fialyzer
WORKDIR /home/opam/fialyzer
ENTRYPOINT ["/home/opam/opam-repository/fialyzer/_build/default/bin/main.exe"]
