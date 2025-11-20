# Use the official Hummingbot image as a base
FROM hummingbot/hummingbot:latest

# Copy your strategy config file into the container's '/conf' directory
COPY hummingbot.yml /home/hummingbot/conf/hummingbot.yml

# This is the final, correct CMD for headless operation.
# It uses the absolute path to the hummingbot executable to guarantee it is found.
CMD [ \
    "bash", "-c", \
    "/home/hummingbot/bin/hummingbot import --key $PRIVATE_KEY && /home/hummingbot/bin/hummingbot start --config-file-name hummingbot.yml" \
]

