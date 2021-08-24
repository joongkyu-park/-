/*
 참고 : https://mungto.tistory.com/49
 */
#include <vector>
#include <algorithm>
 
using namespace std;
 
int solution(vector<vector<int>> routes) {
    //기본 카메라 1대
    int answer = 1;
    //들어온 리스트 정렬
    sort(routes.begin(), routes.end());
    //비교를 위해 처음차가 나가는 부분 체크
    int temp = routes[0][1];
    //리스트 순회하기
    for (auto a : routes) {
        //현재 차가 나가는 부분보다 뒤에 차가 들어온다면
        if (temp < a[0]) {
            //카메라 설치
            answer++;
            //나가는 부분 정정
            temp = a[1];
        }
        //현재 차보다 뒤차가 먼저나가면
        if (temp >= a[1])    temp = a[1];// 나가는 부분을 뒷차로 수정
    }
    return answer;
}
/*
 로직은 맞은거같은아 완전히 시간초과 코드
 */
//#include <string>
//#include <vector>
//#include <algorithm>
//
//using namespace std;
//
//int solution(vector<vector<int>> routes) {
//    int leftEnd = 30000;
//    int rightEnd = -30000;
//
//    for(auto i=0; i<routes.size();i++){
//        if(routes[i][0] < leftEnd) {leftEnd = routes[i][0];}
//        if(routes[i][1] > rightEnd) {rightEnd = routes[i][1];}
//    }
//    vector<int> road;
//    for(auto i=leftEnd; i<=rightEnd; i++){
//        road.push_back(0);
//    }
//    for(auto i=0; i<routes.size();i++){
//        int s = routes[i][0] + abs(leftEnd);
//        int d = routes[i][1] + abs(leftEnd);
//
//        for (auto j=s; j<=d ; j++){
//            road[j] += 1;
//        }
//    }
//
//    int count = 0;
//    int result = 0;
//
//    while (count < routes.size()){
//        int max = 0;
//        int index = 0;
//        for(auto i=0; i<road.size();i++){
//            if (road[i] > max){
//                max = road[i];
//                index = i;
//            }
//        }
//        for(auto i=0; i<routes.size();i++){
//            int s = routes[i][0] + abs(leftEnd);
//            int d = routes[i][1] + abs(leftEnd);
//            if (s <= index && d >= index){
//                for (auto j=s; j<=d; j++){
//                    road[j] -= 1;
//                }
//            }
//        }
//        count += max;
//        result += 1;
//    }
//    return result;
//}
