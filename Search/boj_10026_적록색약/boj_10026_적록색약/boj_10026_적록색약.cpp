#include <iostream>
#include <string>
#include <queue>

using namespace std;

int N;
char map[101][101] = { 0, };
bool check[101][101] = { 0, };
int dx[] = { 1,-1,0,0 };
int dy[] = { 0,0,1,-1 };

int result = 0; // 색약이 아닐 경우 결과값
int result_cw = 0; // 색약일 경우 결과값


// 색약이 아닐경우 BFS
void BFS(int x, int y) {
	queue<pair<int, int>>q;
	q.push(make_pair(x, y));
	char color = map[x][y];
	check[x][y] = true;
	while (!q.empty()) {
		x = q.front().first;
		y = q.front().second;
		q.pop();

		for (int i = 0; i < 4;i++) {
			int nx = x + dx[i];
			int ny = y + dy[i];
			if (nx >= 1 && nx <= N && ny >= 1 && ny <= N) {
				if (map[nx][ny] == color && check[nx][ny] == false) {
					q.push(make_pair(nx, ny));
					check[nx][ny] = true;
				}
			}
		}
	}
	result++;
	return;
}

// 색약일경우 BFS. 위와 완전히 같으며 결과값을 result_cw 으로 받아주는 것만 다름.
void BFS_cw(int x, int y) {
	queue<pair<int, int>>q;
	q.push(make_pair(x, y));
	char color = map[x][y];
	check[x][y] = true;
	while (!q.empty()) {
		x = q.front().first;
		y = q.front().second;
		q.pop();

		for (int i = 0; i < 4;i++) {
			int nx = x + dx[i];
			int ny = y + dy[i];
			if (nx >= 1 && nx <= N && ny >= 1 && ny <= N) {
				if (map[nx][ny] == color && check[nx][ny] == false) {
					q.push(make_pair(nx, ny));
					check[nx][ny] = true;
				}
			}
		}
	}
	result_cw++;
	return;
}

int main()
{
	cin >> N;

	for (int i = 1;i <= N;i++) {
		for (int j = 1; j <= N;j++) {
			char input;
			cin >> input;

			map[i][j] = input;
		}
	}


	// 1.색약이 아닌 경우
	for (int i = 1; i <= N;i++) {
		for (int j = 1; j <= N; j++) {
			if (check[i][j] == false) {
				BFS(i,j);
			}
			else
				continue;
		}
	}


	// 초기화
	for (int i = 1; i <= N;i++) {
		for (int j = 1; j <= N; j++) {
			if (map[i][j] == 'R')
				map[i][j] = 'G'; // R을 전부 G로 바꾸어줌.
		}
	}
	for (int i = 1; i <= N;i++) {
		for (int j = 1; j <= N; j++) {
			check[i][j] = 0;
		}
	}


	// 2.색약인 경우
	for (int i = 1; i <= N;i++) {
		for (int j = 1; j <= N; j++) {
			if (check[i][j] == false) {
				BFS_cw(i, j);
			}
			else
				continue;
		}
	}

	cout << result << " " << result_cw;
}
