#include <string>
#include <vector>

using namespace std;

/*
 1. 선형탐색 코드
 정확성은 맞지만 효율적이지 않다.
 */
bool solution(vector<string> phone_book) {
    bool answer = true;
    
    for (auto prefix: phone_book){
        for(auto phone: phone_book){
            if(phone.size() < prefix.size())
                continue;
            else if(prefix == phone){
                continue;
            }
            else {
                for(int i=0; i<prefix.size();i++){
                    if (prefix[i] != phone[i]){
                        answer = true;
                        break;
                    }
                    answer = false;
                }
                if (answer == false)
                    break;
            }
        }
        if (answer == false)
            break;
    }
    
    return answer;
}

/*
 2. algorithm의 sort사용
 벡터를 sort하면 문자순으로 정렬된다.
 그래서 앞뒤에 있는 문자열들만 비교해주면 되기 때문에 sort함수 제외 for문 1개로 가능
 + 부분문자열을 위해 substr의 사용
 */

bool solution(vector<string> phone_book) {
    bool answer = true;
    sort(phone_book.begin(), phone_book.end());
    for (int i = 0; i < phone_book.size() - 1; i++) {
        if (phone_book[i] == phone_book[i + 1].substr(0, phone_book[i].size())) return false;
    }
    return answer;
}
