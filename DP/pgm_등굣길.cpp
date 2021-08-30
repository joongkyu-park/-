/*
 참고 : https://hochoon-dev.tistory.com/entry/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-%EB%93%B1%EA%B5%A3%EA%B8%B8-c
 DP의 핵심은 점화식 생각하기!
 
 +) 생각해보니까 오른쪽 아래로만 가면 무조건 최단경로네?.. 이게 문제였다
 */

#include <string>
#include <vector>

using namespace std;

int map[101][101];
int d[101][101];
int xMax, yMax;

int solution(int m, int n, vector<vector<int>> puddles) {
    xMax = m;
    yMax = n;
    
    for (auto i=0; i<m ; i++){
        for (auto j=0; j<n ; j++){
            map[i][j] = 1;
        }
    }
    for (auto puddle : puddles){
        map[puddle[0]-1][puddle[1]-1] = 0;
    }
    
    d[0][0]=1;
    for (auto s=1; s<=m+n-2 ; s++){
        int x,y;
        if(s >= n){
            x = s-n+1;
            y = s-x;
        }
        else{
            x = 0;
            y = s;
        }
        while (y>=0 && x<=m-1){
            if (map[x][y] == 0) {
                d[x][y] =0;
                x++;
                y--;
            }
            else{
                if(x==0){
                    d[x][y] = d[x][y-1] %1000000007;
                    x++;
                    y--;
                    continue;
                }
                if(y==0){
                    d[x][y] = d[x-1][y] %1000000007;
                    x++;
                    y--;
                    continue;
                }
                d[x][y] = (d[x-1][y] + d[x][y-1])%1000000007;
                x++;
                y--;
            }
            
        }
    }
    return d[m-1][n-1]%1000000007;
}


// 정확성은 다 맞으나 효율성 빵점.. 아이디어 부족, 비효율적으로 재귀함수 호출 반복
// -> 왜냐하면 최단경로를 구해야한다고 생각해서..ㅠㅠ

//#include <string>
//#include <vector>
//
//using namespace std;
//
//int map[101][101];
//int xMax, yMax;
//int minDistance = -1;
//int cnt = 0;
//
//void goRight(int, int, int);
//void goDown(int, int, int);
//
//void goRight(int d, int x, int y) {
//
//    if (x == xMax-1 && y == yMax-1){
//        if (minDistance == -1){
//            minDistance = d;
//            cnt++;
//            return;
//        }
//        else if(d < minDistance){
//            minDistance = d;
//            cnt = 1;
//            return;
//        }
//        else if(d == minDistance){
//            cnt++;
//            return;
//        }
//        else {return;}
//    }
//    else if (x+1 >= xMax){return;}
//    else {
//        if (map[x+1][y] == 0) {return;}
//        else {
//            goRight(d+1, x+1, y);
//            goDown(d+1, x+1, y);
//        }
//    }
//
//}
//void goDown(int d, int x, int y) {
//
//    if (x == xMax-1 && y == yMax-1){
//        if (minDistance == -1){
//            minDistance = d;
//            cnt++;
//            return;
//        }
//        else if(d < minDistance){
//            minDistance = d;
//            cnt = 1;
//            return;
//        }
//        else if(d == minDistance){
//            cnt++;
//            return;
//        }
//        else {return;}
//    }
//    else if (y+1 >= yMax){return;}
//    else {
//        if (map[x][y+1] == 0) {return;}
//        else {
//            goRight(d+1, x, y+1);
//            goDown(d+1, x, y+1);
//        }
//    }
//}
//
//
//int solution(int m, int n, vector<vector<int>> puddles) {
//    xMax = m;
//    yMax = n;
//
//    for (auto i=0; i<m ; i++){
//        for (auto j=0; j<n ; j++){
//            map[i][j] = 1;
//        }
//    }
//    for (auto puddle : puddles){
//        map[puddle[0]-1][puddle[1]-1] = 0;
//    }
//
//    goRight(0, 0, 0);
//    goDown(0, 0, 0);
//    return cnt/2 % 1000000007;
//}
