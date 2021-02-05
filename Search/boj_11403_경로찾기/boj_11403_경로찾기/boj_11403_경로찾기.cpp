#include <iostream>

using namespace std;


void DFS(int N, int s, int v, int** &adj_mat, int* &visit, int** &CanIGoThere) {
    for (int i = 1;i <= N;i++) {
        if (adj_mat[v][i] != 1 || visit[i] == 1)
            continue;
        CanIGoThere[s][i] = 1;
        visit[i] = 1;
        DFS(N, s, i, adj_mat, visit, CanIGoThere);
    }
}




int main()
{

    int N;


    cin >> N;
    int* visit = new int[N + 1];

    int** adj_mat = new int* [N + 1];
    int** CanIGoThere = new int* [N + 1];
    for (int i = 0;i < N + 1;i++) {
        adj_mat[i] = new int[N + 1];
    }
    for (int i = 0;i < N + 1;i++) {
        CanIGoThere[i] = new int[N + 1];
    }

    
    // 0으로 초기화
    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= N; j++) {
            CanIGoThere[i][j] = 0;
        }
    }
    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= N; j++) {
            adj_mat[i][j] = 0;
        }
    }
    for (int i = 1; i <= N; i++) {
        visit[i] = 0;
    }
    //


    

    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= N; j++) {
            int num;
            cin >> num;
            if (num != 1)
                continue;
            adj_mat[i][j] = 1;
        }
    }

    for (int i = 1;i <= N;i++) {
        DFS(N, i, i, adj_mat, visit, CanIGoThere);
        for (int i = 1; i <= N; i++) {
            visit[i] = 0;
        }
    }

    for (int i = 1; i <= N; i++) {
        for (int j = 1; j <= N; j++) {
            cout << CanIGoThere[i][j] << " ";
        }
        cout << "\n";
    }

}
