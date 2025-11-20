FROM hummingbot/hummingbot:latest

# Copy the config to the conf folder (Hummingbot expects it here)
COPY conf/flashloan_arbitrum_live.yml /conf/flashloan_arbitrum_live.yml

# Official non-interactive start: Loads config, connects Aave, starts script
WORKDIR /home/hummingbot
CMD ["./start", "--script", "flashloan_arbitrage", "--conf", "flashloan_arbitrum_live.yml"]
