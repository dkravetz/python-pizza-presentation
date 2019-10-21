FROM ubuntu:19.10

RUN apt-get update -y && apt-get install -y pandoc

WORKDIR /home/ubuntu

CMD pandoc -t revealjs -s -o testerino.html test.md -V theme=solarized --slide-level=2 -V revealjs-url=. --standalone