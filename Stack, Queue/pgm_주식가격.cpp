#include <string>
#include <vector>


using namespace std;

// 정확성은 맞지만, 효율성 0점..
vector<int> solution(vector<int> prices) {
    vector<int> answer;
    
    vector<int> q;
    int current_price = 0;
    
    for (int i = 0; i < prices.size(); i++){
        answer.push_back(-1);
    }
    for (int i = 0; i < prices.size(); i++){
        q.push_back(prices[i]);
        current_price = prices[i];
        
        for(int j = 0; j < q.size(); j++){
            if (q[j] > current_price && answer[j] == -1){
                answer[j] = i - j;
            }
        }
    }
    for (int i = 0; i<answer.size();i++){
        if (answer[i] == -1){
            answer[i] = answer.size()-1-i;
        }
    }
    
    return answer;
}

/*
 이중 for문이 문제인 줄 알았지만 아니었다.
 위의 코드와 아래 코드의 차이점
 아래 : i번째 차례가 올 때마다 i+1번째부터 최악의 경우 끝까지 비교하여 i번째의 answer값을 알아냄 -> 중간에 break 가능함
 위 : i번째 차례때마다 0번째부터 i번째까지 무조건 비교해야함. -> 효율성 떨어짐
 */

vector<int> solution(vector<int> prices) {
    vector<int> answer;
    
    for(int i = 0; i < prices.size(); i++){
        int current_price = 0;
        for (int j = i + 1; j <prices.size(); j++) {
            if (prices[j] >= prices[i]) {
                current_price++;
            }
            else {
                current_price++;
                break;
            }
        }
        answer.push_back(current_price);
    }
    
    return answer;
}
