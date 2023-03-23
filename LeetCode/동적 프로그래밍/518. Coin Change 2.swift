class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp = Array(repeating: 0, count: amount + 1)
        dp[0] = 1
        var coins = coins.sorted()

        for coin in coins {
            if coin > amount {
                continue
            }
            for i in coin...amount {
                dp[i] += dp[i-coin]
            }
        }
        return dp[amount]
    }
}
