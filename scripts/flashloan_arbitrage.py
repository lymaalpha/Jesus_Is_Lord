# scripts/flashloan_arbitrage.py
from hummingbot.strategy.script_strategy_base import ScriptStrategyBase

class FlashLoanArbitrage(ScriptStrategyBase):
    markets = {
        "camelot_v3_arbitrum": {"WETH-USDC", "ARB-USDC", "GMX-USDC"},
        "uniswap_v3_arbitrum": {"WETH-USDC", "WBTC-WETH"},
        "sushiswap_arbitrum": {"WETH-USDC"}
    }

    def on_tick(self):
        # Simple cross-DEX arb with Aave flash loan
        for token in ["WETH", "USDC", "ARB", "GMX"]:
            price1 = self.connectors["camelot_v3_arbitrum"].get_price(f"{token}-USDC", True)
            price2 = self.connectors["uniswap_v3_arbitrum"].get_price(f"{token}-USDC", True)
            if price1 and price2 and abs(price1 - price2) / min(price1, price2) > 0.0008:  # 0.08%
                amount = 1_000_000 / price2  # ~$1M loan size
                self.flash_loan_aave_v3("USDC", amount, self.arbitrage_path(token))
                self.logger().info(f"Arbitrage executed: {token} | Profit ~${(abs(price1-price2)/price2)*amount:.2f}")

    def arbitrage_path(self, token: str):
        return [
            ("camelot_v3_arbitrum", f"{token}-USDC", True),
            ("uniswap_v3_arbitrum", f"{token}-USDC", False)
        ]
