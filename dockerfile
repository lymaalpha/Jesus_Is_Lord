# Final Dockerfile for Render Standalone Deployment - November 2025

# 1. Use the official, latest Hummingbot image as the foundation.
FROM hummingbot/hummingbot:latest

# 2. Copy your strategy configuration file into the '/conf' directory inside the container.
COPY hummingbot.yml /home/hummingbot/conf/hummingbot.yml

# 3. The command to run on container startup.
#    This uses the full, absolute path to the 'hummingbot' executable to avoid any 'command not found' errors.
#    It first imports the private key from the Render environment variable.
#    Then, it starts the bot using your configuration file.
CMD [ \
    "bash", "-c", \
    "/home/hummingbot/bin/hummingbot import --key $PRIVATE_KEY && /home/hummingbot/bin/hummingbot start --config-file-name hummingbot.yml" \
]
