FROM ubuntu:18.04
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    &&  apt-get remove --purge python2 && apt-get install python3.6
    

ENV LANG en_US.utf8
WORKDIR /app
COPY ./requirements.txt /app
RUN python -m pip --no-cache-dir install --upgrade pip setuptools wheel && \
    pip --no-cache-dir  install -r requirements.txt && python -m spacy download en && \
    python -m nltk.downloader punkt 
    
CMD ["sh"]
