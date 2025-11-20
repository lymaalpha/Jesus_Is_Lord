# Use the official Hummingbot image as a base
FROM hummingbot/hummingbot:latest

# Copy your strategy config file into the container's '/conf' directory
COPY hummingbot.yml /home/hummingbot/conf/hummingbot.yml

# This CMD uses absolute paths for all commands to guarantee they are found.
# It executes start.sh, then imports the key, then starts the strategy.
CMD [ \
    "bash", "-c", \
    "/home/hummingbot/start.sh && /home/hummingbot/bin/hummingbot import --key $PRIVATE_KEY && /home/hummingbot/bin/hummingbot start --strategy flashloan_arbitrage --config-file-name hummingbot.yml" \
]
