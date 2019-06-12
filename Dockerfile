FROM ubuntu:16.04

MAINTAINER R

# Installing base software
RUN apt-get update && \
    apt-get install -y git wget nano python3 python3-pip && \
    pip3 install -U spacy && \
    python3 -m spacy download en && \
    python3 -m spacy download es && \
    pip3 install Flask

# Download scripts from repo
RUN git clone https://github.com/richiemig/spfla.git spfla

EXPOSE 3000

CMD /spfla/run_spfla.py