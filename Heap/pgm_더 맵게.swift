/*
 교훈
 Heap만들려고 하지말고 pq를 이용하자 ...
 */

// pq를 썼더니 너무 간단하고.. 빠르게 풀렸다..

#include <string>
#include <vector>
#include <queue>

using namespace std;

int solution(vector<int> scoville, int K) {
    priority_queue<int, vector<int>, greater<int>> pq;
    
    for (auto i = 0; i<scoville.size();i++){
        pq.push(scoville[i]);
    }
    
    int answer = 0;
    while(pq.size()>=2){
        if(pq.top() >= K){
            break;
        }
        else {
            int first, second;
            first = pq.top();
            pq.pop();
            second = pq.top();
            pq.pop();
            
            int mixed = first + 2*second;
            
            pq.push(mixed);
            answer++;
        }
    }
    if(pq.size()==1){
        if (pq.top()>=K){
            
        }
        else {
            answer = -1;
        }
    }
    return answer;
}


/*
 pq안쓰고 힙 만들어서 틀린 코드(정확성에서 왜 틀렸는지 모르겠음)
 */

#include <string>
#include <vector>
#include <algorithm>

using namespace std;

// 다운힙 : 힙 구조조건 정렬
void downHeap(vector<int> &v, int index) {
    int current = v[index];

    if (index*2 > v.size()-1){
        return;
    }
    else if (index*2+1 > v.size()-1){
        int leftChild = v[index*2];

        if (leftChild < current){
            v[index*2] = current;
            v[index] = leftChild;
            return;
        }
        else {
            return;
        }
    }
    else {
        int leftChild = v[index*2];
        int rightChild = v[index*2+1];

        if (leftChild < rightChild) {
            if (leftChild < current){
                v[index*2] = current;
                v[index] = leftChild;
                downHeap(v, index*2);
            }
            else {
                return;
            }
        }
        else {
            if (rightChild < current){
                v[index*2+1] = current;
                v[index] = rightChild;
                downHeap(v, index*2+1);
            }
            else {
                return;
            }
        }
    }
}

// 최소 스코빌 지수가 K이상인지
bool check(vector<int> &v, int K) {
    if (v[1] < K) return true;
    else return false;
}

int solution(vector<int> scoville, int K) {
    vector<int> v = scoville;

    int answer = 0;

    // 최초 스코빌지수들을 오름차순으로 정렬
    sort(v.begin(), v.end(), less<int>());

    // 배열의 인덱스 0번은 사용하지 않음
    v.insert(v.begin(), -1);

    // 반복루프
    while (check(v, K)) {

        // 배열의 크기가 2(0번 인덱스 포함)인데 check에서 true가 나왔다면 -> return -1
        if (v.size() == 2){
            answer = -1;
            break;
        }

        int first = v[1];
        int second;
        if (v.size() == 3){
            second = v[2];
        }
        else {
            second = min(v[2],v[3]);
        }

        int mixed = first + second*2;

        v[1] = v[v.size()-1];
        v.pop_back();
        downHeap(v, 1);
        v[1] = v[v.size()-1];
        v.pop_back();
        downHeap(v, 1);

        v.insert(v.begin()+1, mixed);
        downHeap(v, 1);
        answer++;
    }

    return answer;
}
