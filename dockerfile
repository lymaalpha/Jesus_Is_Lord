FROM hummingbot/hummingbot:latest

COPY conf/flashloan_arbitrum_live.yml /conf/flashloan_arbitrum_live.yml

# Correct start command for 2025 Docker image
CMD ["bash", "-c", "sleep 10 && \
     /home/hummingbot/bin/hummingbot_quickstart --no-wizard && \
     echo 'y' | gateway connect aave_v3_arbitrum && \
     start --script flashloan_arbitrage --conf /conf/flashloan_arbitrum_live.yml"]
