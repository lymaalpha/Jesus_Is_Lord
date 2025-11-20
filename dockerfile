FROM hummingbot/hummingbot:latest

# Copy our config
COPY conf/flashloan_arbitrage.yml /conf/flashloan_arbitrage.yml

# Switch to the correct directory
WORKDIR /home/hummingbot

# The only CMD that works reliably on Render background workers in Nov 2025
CMD ["bash", "-c", "\
     sleep 8 && \
     echo 'y' | python3 -m hummingbot.client quickstart --script flashloan_arbitrage --script-config flashloan_arbitrage.yml \
     "]
