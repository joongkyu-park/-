*참고 : https://jun-itworld.tistory.com/18*



+ 굳이 Node 클래스를 만들필요 없다.
+ 정점 번호가 작은 것을 먼저 방문하기 위해서 ''인접행렬''을 사용한다.
+ DFS, BFS 기본!



최초코드

```c++
#include <iostream>
#include <vector>
#include <queue>

using namespace std;

class Node {
public:
	int data;
	vector<Node*> incidentVertices;
	int flag = 0;

	Node(int data) {
		this->data = data;
	}
};

void DFS(Node* v) {
	cout << v->data << " ";
	v->flag = 1;
	for (int i = 0;i < v->incidentVertices.size();i++) {
		if (v->incidentVertices[i]->flag == 0) {
			DFS(v->incidentVertices[i]);
		}
	}
	return;
}

void BFS(Node* v) {



}

int main() {
	int N, M, V;
	cin >> N >> M >> V;

	vector<Node> vertices;
	int i = 1;
	while (N--) {
		Node* n = new Node(i);
		vertices.push_back(*n);
		i++;
	}
	while (M--) {
		int start, destination;
		cin >> start >> destination;

		int flag = 0;
		Node* start_v = nullptr;
		Node* destination_v = nullptr;

		for (int i = 0; i < vertices.size();i++) {
			if (vertices[i].data == start) {
				start_v = &vertices[i];
				flag++;
			}
			else if (vertices[i].data == destination) {
				destination_v = &vertices[i];
				flag++;
			}
			else if (flag == 2) {
				break;
			}
		}

		start_v->incidentVertices.push_back(destination_v);
		destination_v->incidentVertices.push_back(start_v);
	}

	Node* search_start_v = nullptr;
	for (int i = 0; i < vertices.size();i++) {
		if (vertices[i].data == V) {
			search_start_v = &vertices[i];
			break;
		}
	}

	DFS(search_start_v);
	cout << '\n';
	BFS(search_start_v);


}
```

