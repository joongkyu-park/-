#include <iostream>
#include <algorithm>
#include <cmath>
#include <vector>
using namespace std;

int N;

int main(){

	vector<int> A;
	cin >> N;
	int num;
	for (int i = 0;i < N;i++) {		
		cin >> num;
		A.push_back(num);
	}

	int result = 0;
	int tmp = 0;

	sort(A.begin(), A.end(), less<int>());

	do {
		tmp = 0;
		for (int i = 0; i < N- 1;i++) {
			tmp += abs(A[i] - A[i + 1]);
		}
		if (tmp > result) {
			result = tmp;
		}
	} while (next_permutation(A.begin(), A.end()));


	cout << result;
}
