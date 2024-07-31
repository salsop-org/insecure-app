FROM ubuntu@sha256:2e863c44b718727c860746568e1d54afd13b2fa71b160f5cd9058fc436217b30

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "curl https://checkip.amazonaws.com" ]

RUN apt-get update 
RUN apt-get install python3 -y --no-install-recommends
RUN apt-get install python3-pip -y --no-install-recommends
RUN useradd -ms /bin/bash app

# Install Python Requirements
WORKDIR /app
COPY *.py /app/
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt --break-system-packages

