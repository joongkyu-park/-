/*
 1. 최대 500x500의 벡터를 인자로 넣어주면 시간초과!
 -> 전역변수로 다루자.
 2. Top-down vs. Bottom-up 어떤 방법을 쓸 것인가
 Top-down : 보통 재귀, 메모이즘 이용
 Bottom-up : 보통 반복문
 */

#include <string>
#include <vector>
#define max_int 501
using namespace std;

int matrix[max_int][max_int];
int d[max_int][max_int];
int height;
void findMax(int level, int index){
    
    d[level-1][index] = max(d[level][index], d[level][index+1]) + matrix[level-1][index];
}

int solution(vector<vector<int>> triangle) {
        height = triangle.size()-1;
    
    for(int i=0; i<=height; i++){
        for(int j=0; j<=i; j++){
            matrix[i][j] = triangle[i][j];
        }
    }
    for (auto i=0; i<= height; i++){
        d[height][i] = matrix[height][i];
    }
    for (auto level = height; level>0; level--) {
        for (auto i=0; i< level; i++){
            findMax(level, i);
        }
    }
    return d[0][0];
}

// 시간초과 코드. 메모이즘을 사용하지 않고 계속된 재귀호출함! 효율성 빵점
//#include <string>
//#include <vector>
//#define max_int 501
//
//using namespace std;
//
//int a[max_int][max_int];
//int height;
//
//int findMax(int beforeSum, int level, int index){
//    int currentSum = beforeSum + a[level][index];
//
//    if (level + 1 == height) {
//        return currentSum;
//    }
//
//    int leftChild = findMax(currentSum, level+1, index);
//    int rightChild = findMax(currentSum, level+1, index+1);
//
//    return (leftChild > rightChild) ? leftChild : rightChild;
//}
//
//int solution(vector<vector<int>> triangle) {
//    height = triangle.size();
//    int max = -1;
//        for(int i=0; i<height; i++){
//        for(int j=0; j<=i; j++){
//            a[i][j] = triangle[i][j];
//        }
//    }
//    max = findMax(0, 0, 0);
//    return max;
//}
