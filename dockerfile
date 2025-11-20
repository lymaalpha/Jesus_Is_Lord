# Use the official Hummingbot image as a base
FROM hummingbot/hummingbot:latest

# Copy your strategy config file into the container's '/conf' directory
COPY hummingbot.yml /home/hummingbot/conf/hummingbot.yml

# This is the modern, correct CMD for headless operation.
# It directly calls the hummingbot application without using the missing start.sh script.
CMD [ \
    "bash", "-c", \
    "hummingbot import --key $PRIVATE_KEY && hummingbot start --config-file-name hummingbot.yml" \
]
