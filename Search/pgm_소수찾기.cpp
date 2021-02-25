#include <string>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;

vector<bool>primeCheck(10000000);
vector<bool>answerCheck(10000000);
void isPrime(int max){
    
    for(int i=2; i*i<=max;i++){
        if(primeCheck[i]==false){
            continue;
        }
        for (int j=i*i;j<=max;j+=i){
            primeCheck[j]=false;
        }
    }
}
int solution(string numbers) {
    
    int answer = 0;
    
    string s = numbers;
    sort(s.begin(),s.end(),greater<char>());
    
    string forMax = "";
    for(int i=0;i<s.size();i++){
        forMax += s[i];
    }
    
    int max = stoi(forMax);
    
    primeCheck[0]=false;
    primeCheck[1]=false;
    for(int i=2;i<10000000;i++){
        primeCheck[i]=true;
    }
    isPrime(max);
    
    
    for(int i=0;i<10000000;i++){
        answerCheck[i]=false;
    }
    sort(numbers.begin(),numbers.end(),less<char>());
    do{
        for(int i=1;i<=numbers.size();i++){
            string tmp = "";
            tmp = numbers.substr(0,i);
            int check = stoi(tmp);
            if(primeCheck[check]==true){
                if(answerCheck[check]==false){
                    answer++;
                    answerCheck[check]=true;
                }
                
            }
        }
    } while(next_permutation(numbers.begin(),numbers.end()));
    
    return answer;
    
}
