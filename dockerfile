# Use the official Hummingbot image
FROM hummingbot/hummingbot:latest

# Set the working directory to where the scripts are located
WORKDIR /home/hummingbot

# Copy your strategy config file into the container's '/conf' directory
COPY hummingbot.yml /home/hummingbot/conf/hummingbot.yml

# This is the command that will run when the container starts.
# It correctly finds and executes start.sh, imports the private key from the
# environment variable, and starts the built-in flashloan_arbitrage strategy.
CMD [ \
    "bash", "-c", \
    "\"./start.sh && hummingbot import --key $PRIVATE_KEY && hummingbot start --strategy flashloan_arbitrage --config-file-name hummingbot.yml\"" \
]
