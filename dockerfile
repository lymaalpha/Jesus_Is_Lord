FROM hummingbot/hummingbot:latest

# Copy script + config
COPY scripts/flashloan_arbitrage.py /scripts/flashloan_arbitrage.py
COPY conf/flashloan_arbitrage.yml /conf/flashloan_arbitrage.yml   # optional, can be empty

WORKDIR /home/hummingbot
CMD ["bash", "-c", "sleep 10 && ./start --script flashloan_arbitrage.py --no-prompt"]
