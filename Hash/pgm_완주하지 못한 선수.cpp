/*
 - unordered_map의 사용
    -> key를 마치 배열의 Index처럼 사용한다! ex) hash[name]++ (value가 Int)
 - for(string name : participant) 형태 사용
    데이터 타입이 너무 길면 auto로!
 */
#include <string>
#include <vector>
#include <unordered_map>

using namespace std;

string solution(vector<string> participant, vector<string> completion) {

    string answer = "";
    unordered_map<string, int> hash;
    
    for(string name : participant){
        hash[name]++;
    }
    for(string name : completion){
        hash[name]--;
    }
    for(auto pair : hash){
        if(pair.second > 0)
        {
            answer = pair.first;
            break;
            
        }
    }
    
    
    return answer;
}
