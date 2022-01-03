let n = Int(readLine()!)!

var tree = Array(repeating: [-1,-1,-1], count: n+1)
var levels = Array(repeating: [n+1,-1], count: n+1)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    let p = input[0]
    let c1 = input[1]
    let c2 = input[2]
    
    tree[p][1] = c1
    tree[p][2] = c2
    
    if c1 != -1{
        tree[c1][0] = p
    }
    if c2 != -1{
        tree[c2][0] = p
    }
}

var cnt = 1
func preorder(_ node: Int, _ level: Int){
    
    if tree[node][1] != -1 {
        preorder(tree[node][1], level+1)
    }
    
    if levels[level][0] > cnt {
        levels[level][0] = cnt
    }
    if levels[level][1] < cnt {
        levels[level][1] = cnt
    }
    cnt += 1
    
    if tree[node][2] != -1 {
        preorder(tree[node][2], level+1)
    }
}

var root = -1
var cur = 1
while true{
    if tree[cur][0] != -1{
        cur = tree[cur][0]
    }
    else {
        root = cur
        break
    }
}
preorder(root, 1)

var answerLevel = -1
var max = -1

for i in 1..<levels.count {
    let level = levels[i]
    
    if level[0] == -1 && level[1] == -1{
        break
    }
    if level[1]-level[0]+1 > max {
        max = level[1]-level[0]+1
        answerLevel = i
    }
}

print("\(answerLevel) \(max)")
