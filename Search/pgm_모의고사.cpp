#include <string>
#include <vector>

using namespace std;

vector<int> solution(vector<int> answers) {
    vector<int> answer;
    
    int first=0, second=0, third =0;
    int num=0;
    for(int i=1;i<=answers.size();i++){
        num++;
        if(num>5)
            num -= 5;
        
        if(answers[i-1]==num)
            first++;
    }
    num =0;
    for(int i=1;i<=answers.size();i++){
        if(i%2==0){
            num++;
            if(num==2)
                num++;
            if(num>5)
                num -= 5;
            if(answers[i-1]==num)
                second++;
        }else{
            if(answers[i-1]==2)
                second++;
        }
    }
    int forThird[10] = {3,3,1,1,2,2,4,4,5,5};
    num =0;
    for(int i=1;i<=answers.size();i++){
        if(num>9){
            num=0;
        }
        if(answers[i-1]==forThird[num])
            third++;
        num++;
    }
    
    if(first>second){
        if(first>third){
            answer.push_back(1);
        }else if(first<third){
            answer.push_back(3);
        }else{
            answer.push_back(1);
            answer.push_back(3);
        }
    }else if(first<second){
        if(second>third){
            answer.push_back(2);
        }else if(second<third){
            answer.push_back(3);
        }else{
            answer.push_back(2);
            answer.push_back(3);
        }
    }else{
        if(first>third){
            answer.push_back(1);
            answer.push_back(2);
        }else if(first<third){
            answer.push_back(3);
        }else{
            answer.push_back(1);
            answer.push_back(2);
            answer.push_back(3);
        }
    }
    
    
    return answer; 
}
