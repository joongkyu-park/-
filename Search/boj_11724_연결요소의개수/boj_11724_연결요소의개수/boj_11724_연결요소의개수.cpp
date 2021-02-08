#include <iostream>

using namespace std;

int N, M;
int result = 0;

int** adj_mat;
bool* visited;

void DFS(int start) {
    visited[start] = true;

    for (int i = 1;i <= N;i++) {
        if (!visited[i] && adj_mat[start][i]) {
            DFS(i);
        }
        else {
            continue;
        }
    }
}

bool Check() {
    for (int i = 1;i <= N;i++) {
        if (visited[i]) {
            continue;
        }
        else {
            return true;
        }
    }
    return false;
}
int main()
{
    cin >> N >> M;



    adj_mat = new int* [N + 1];
    visited = new bool[N + 1];

    // 전역변수 세팅
    for (int i = 0;i < N + 1;i++) {
        adj_mat[i] = new int[N + 1];
    }


    // 전역변수 초기화
    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= N; j++) {
            adj_mat[i][j] = 0;
        }
    }
    for (int i = 1; i <= N; i++) {
        visited[i] = false;
    }
	

    while(M--) {
        int num1, num2;
        cin >> num1 >> num2;
        adj_mat[num1][num2] = 1;
        adj_mat[num2][num1] = 1;
    }


    int start = 1;
    while (Check()) {
        if (visited[start]) {
            while (visited[start]) {
                start++;
                continue;
            }
        }
        else {
            DFS(start);
            result++;
        }
    }

    cout << result;

    for (int i = 0; i < N + 1;i++) {
        delete[] adj_mat[i];
    }
    delete[] adj_mat;
    delete[] visited;
}
