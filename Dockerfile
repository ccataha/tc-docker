FROM python:3.8-slim-buster
RUN apt-get update && apt-get install -y --no-install-recommends \
    iperf \
    iproute2 \
    iptables \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/* \
    && pip install tcconfig==0.28.0
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
