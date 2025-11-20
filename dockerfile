CMD [ \
    "bash", "-c", \
    "./start.sh && hummingbot import --key $PRIVATE_KEY && hummingbot start --strategy flashloan_arbitrage --config-file-name hummingbot.yml" \
]
