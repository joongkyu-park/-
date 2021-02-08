#include <iostream>
#include <string>
#include <queue>
using namespace std;

int N, M;
int** map;
int** check;
int dir_x[] = { -1, 1, 0,0 };
int dir_y[] = { 0,0,1,-1 };
void BFS(int x, int y) {
	queue<pair<int, int>> q;
	q.push(make_pair(0, 0));
	check[x][y] = 1;
	while (!q.empty()) {
		x = q.front().first;
		y = q.front().second;
		q.pop();

		for (int i = 0; i < 4;i++) {
			int nx = x + dir_x[i];
			int ny = y + dir_y[i];
			if (nx >= 0 && nx < N && ny >= 0 && ny < M) {
				if (check[nx][ny] == 0 && map[nx][ny] == 1) {
					q.push(make_pair(nx, ny));
					check[nx][ny] = check[x][y] + 1;
				}
				else if (check[nx][ny] == 0)
					check[nx][ny] = -1;
			}

		}
	}
}
int main()
{
	cin >> N >> M;

	map = new int* [N];
	check = new int* [N];
	for (int i = 0;i < N;i++)
		map[i] = new int[M];
	for (int i = 0;i < N;i++)
		check[i] = new int[M];

	for (int i = 0; i < N;i++)
		for (int j = 0;j < M;j++)
			check[i][j] = 0;

	for (int i = 0;i < N;i++) {
		string row;
		cin >> row;
		for (int j = 0;j < M;j++) {
			map[i][j] = row[j] - '0';
		}
	}
	BFS(0, 0);

	cout << check[N - 1][M - 1];


}