/*
 참고 : https://mungto.tistory.com/49
 */

#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    vector<vector<int>> routes = {{-20,-15}, {-18,-13}, {-14,-5}, {-5,-3}};
    sort(routes.begin(), routes.end());
    
    int answer = 1;
    sort(routes.begin(), routes.end());
    int end = routes[0][1];
    
    for (auto route : routes) {
        /*
         1) 기준 차의 끝점 < 현재 차의 시작점
         -> 기준 차를 현재차로 갱신, anwser 1개 추가
         */
        if (end < route[0]) {
            answer++;
            end = route[1];
        }
        
        /*
         2) 기준 차의 끝점 >= 현재 차의 끝점
         -> 언젠가 CCTV를 추가하면 현재 기준차도 반드시 포함하게 됨
         -> 기준 차를 현재차로 갱신
         */
        if (end >= route[1]){
            end = route[1];
        }
    }
}
