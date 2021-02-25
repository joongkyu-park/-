#include <string>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int main(){
    int N;
    cin >> N;
    int cost[3];
    int d[N+1][3];
    
    d[0][0] = d[0][1] = d[0][2] = 0;
    for(int i = 1;i<=N;i++){
        cin >> cost[0] >> cost[1] >> cost[2] ;
        d[i][0] = min(d[i-1][1],d[i-1][2])+cost[0];
        d[i][1] = min(d[i-1][0],d[i-1][2])+cost[1];
        d[i][2] = min(d[i-1][0],d[i-1][1])+cost[2];
    }
    
    cout << min(d[N][0],min(d[N][1],d[N][2]));
    
}
