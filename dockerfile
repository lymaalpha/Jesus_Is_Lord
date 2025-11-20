FROM hummingbot/hummingbot:latest

# Copy config (rename to standard name if not already)
COPY conf/flashloan_arbitrage.yml /conf/flashloan_arbitrage.yml

# Set working dir
WORKDIR /home/hummingbot

# Headless start with loop to prevent exit
CMD ["bash", "-c", "\
     ./start --no-prompt --import-private-key ${PRIVATE_KEY} --rpc-url ${ETHEREUM_RPC_URL} --network arbitrum && \
     hummingbot start --script flashloan_arbitrage --conf flashloan_arbitrage.yml && \
     tail -f /dev/null"]
