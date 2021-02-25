#include <string>
#include <vector>

using namespace std;

int solution(int n, vector<int> lost, vector<int> reserve) {
    int answer = 0;
    
    bool isLost[n+1];
    bool isReserve[n+1];
    int clothesNum[n+1];
    
    for(int i=0;i<n+1;i++){
        isLost[i]=false;
        isReserve[i]=false;
        clothesNum[i]=0;
    }
    for(int i=0;i<lost.size();i++){
        isLost[i]=true;
    }
    for(int i=0;i<reserve.size();i++){
        isReserve[i]=true;
    }
    
    for(int i=1;i<n+1;i++){
        if(isLost[i]==false){
            clothesNum[i]++;
        }
        if(isReserve[i]==true){
            clothesNum[i]++;
        }
    }
    
    for(int i=1;i<n+1;i++){
        if(isLost[i]==true){
            if(clothesNum[i-1]==2 && i-1>=1){
                clothesNum[i-1]--;
                clothesNum[i]++;
                continue;
            }
            if(clothesNum[i+1]==2 && i+1<=n){
                clothesNum[i+1]--;
                clothesNum[i]++;
                continue;
            }
        }
    }
    
    for(int i=1;i<n+1;i++){
        answer+=clothesNum[i];
    }
    
    return answer;
}
