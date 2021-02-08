#include <iostream>

using namespace std;

int n, m;
int p1, p2;

int** adj_mat;
bool* visited;
bool flag = false;
int depth;
int level = 0;

void DFS(int p1, int level) {
	level++;
	visited[p1] = true;
	for (int i = 1; i <= n;i++) {
		if (visited[i] || adj_mat[p1][i] == 0) {
			continue;
		}
		else if (i == p2) {
			flag = true;
			depth = level;
			return;
		}
		else {
			DFS(i, level);

		}
	}
	return;
}
int main()
{
	cin >> n;
	cin >> p1 >> p2;

	adj_mat = new int* [n + 1];
	for (int i = 0;i < n + 1;i++) {
		adj_mat[i] = new int[n + 1];
	}
	for (int i = 0;i < n + 1;i++) {
		for (int j = 0;j < n + 1;j++) {
			adj_mat[i][j] = 0;
		}
	}

	visited = new bool[n + 1];
	for (int j = 0;j < n + 1;j++) {
		visited[j] = false;
	}

	cin >> m;
	while (m--) {
		int x, y;
		cin >> x >> y;

		adj_mat[x][y] = 1;
		adj_mat[y][x] = 1;
	}
	DFS(p1, level);

	if (flag)
		cout << depth;
	else
		cout << -1;
	
}