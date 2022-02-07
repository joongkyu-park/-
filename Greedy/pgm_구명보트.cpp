/*
 참고 : https://velog.io/@diddnjs02/%EC%BD%94%EB%94%A9%ED%85%8C%EC%8A%A4%ED%8A%B8%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EA%B5%AC%EB%AA%85%EB%B3%B4%ED%8A%B8
 
 알고리즘적 사고만 할 수 있었다면 너무 간단했던 코드.
 항상 그 최초의 알고리즘적 사고, 아이디어가 중요한듯하다.
 이걸 천부적으로 잘하지않는 이상 문제를 많이 보고 익히는게 길일 듯 하다.
 */

#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int solution(vector<int> people, int limit) {
    vector<int> arr = people;
    int answer = 0;
    int lIndex = 0;
    int rIndex = arr.size()-1;
    sort(arr.begin(),arr.end());
    
    while (lIndex <= rIndex) {
        if (arr[lIndex] + arr[rIndex] <= limit) {
            lIndex += 1;
            rIndex -= 1;
            answer += 1;
        }
        else {
            rIndex -= 1;
            answer += 1;
        }
    }
    
    return answer;
}
