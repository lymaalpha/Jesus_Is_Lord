FROM hummingbot/hummingbot:latest

COPY conf/flashloan_arbitrum_live.yml /conf/flashloan_arbitrum_live.yml

CMD ["bash", "-c", "sleep 10 && /home/hummingbot/bin/hummingbot_quickstart --no-wizard --script flashloan_arbitrage --conf /conf/flashloan_arbitrum_live.yml"]
