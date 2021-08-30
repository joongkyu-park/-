/*
 참고 : https://chosh95.tistory.com/371
 이런 점화식 세우는 dp문제는 너무 익숙치가 않아서 감이 안잡힌다. 많이 봐야겠다.
 */
#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int dp[1000001];
int dp2[1000001];

int solution(vector<int> money) {
    int res = 0;
    int n = money.size() - 1;
    dp[0] = money[0];
    dp[1] = money[0];
    dp2[0] = 0;
    dp2[1] = money[1];

    for (int i = 2; i < n; i++) {
        dp[i] = max(dp[i - 2] + money[i], dp[i - 1]);
        dp2[i] = max(dp2[i - 2] + money[i], dp2[i - 1]);
    }
    dp2[n] = max(dp2[n - 2] + money[n], dp2[n - 1]);

    return res = max(dp[n - 1], dp2[n]);
}
