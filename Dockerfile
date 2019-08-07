FROM ocaml/opam2:4.07

RUN sudo apt-get update
RUN sudo apt-get install -y libgmp-dev perl pkg-config m4 zlib1g-dev

RUN git clone https://github.com/dwango/fialyzer.git

WORKDIR fialyzer

RUN opam update
RUN opam pin add -y --debug fialyzer .
RUN eval $(opam env) && make

ENTRYPOINT _build/default/bin/main.exe
