#include <iostream>
#include <queue>

using namespace std;

#define MAX_VALUE 1001


int N, M, V;
int adj_mat[MAX_VALUE][MAX_VALUE]{ 0 };
int visit[MAX_VALUE]{ 0 };

void DFS(int V) {
	cout << V << " ";
	visit[V] = 1;

	for (int i = 1; i <= N; i++) {
		if (visit[i] == 1 || adj_mat[V][i] == 0)
			continue;
		DFS(i);
	}
}

void BFS(int V) {
	queue<int> q;
	q.push(V);
	visit[V] = 1;  // 큐에 넣을 때 visit을 해줘야 중복으로 넣지 않는다.
	
	while (!q.empty()) {
		int v = q.front();
		cout << v << " ";
		q.pop();
		for (int i = 1;i <= N; i++) {
			if (visit[i] == 1 || adj_mat[v][i] == 0)
				continue;
			q.push(i);
			visit[i] = 1;
		}
	}
}

int main() {
	cin >> N >> M >> V;

	for (int i = 0; i < M;i++) {
		int s, d;
		cin >> s >> d;
		adj_mat[s][d] = adj_mat[d][s] = 1;
	}
	
	DFS(V);
	cout << "\n";

	for (int i = 0; i < MAX_VALUE; i++) {
		visit[i] = 0;
	}

	BFS(V);
}