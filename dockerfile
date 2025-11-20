FROM hummingbot/hummingbot:version-2.2.2
COPY conf/flashloan_arbitrum_live.yml /conf/flashloan_arbitrum_live.yml
CMD ["bash", "-c", "sleep 10 && python3 /home/hummingbot/hummingbot/quickstart.py --no-wizard && gateway connect aave_v3_arbitrum && start --script flashloan_arbitrage --conf /conf/flashloan_arbitrum_live.yml"]
