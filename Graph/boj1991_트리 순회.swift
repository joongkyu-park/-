let n = Int(readLine()!)!

var ll = Array(repeating: [-1,-1,-1], count: n)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
        
    
    let parent = Int(UnicodeScalar(input[0])!.value)-65
    let c1 = Int(UnicodeScalar(input[1])!.value)-65
    let c2 = Int(UnicodeScalar(input[2])!.value)-65
    
    if (0...25).contains(c1){
        ll[parent][1] = c1
        ll[c1][0] = parent
    }
    if (0...25).contains(c2){
        ll[parent][2] = c2
        ll[c2][0] = parent
    }
}


func preorder(_ node: Int){
 
    print(UnicodeScalar(node+65)!, terminator: "")
    if ll[node][1] != -1{
        preorder(ll[node][1])
    }
    if ll[node][2] != -1{
        preorder(ll[node][2])
    }
}

func inorder(_ node: Int){
    
    if ll[node][1] != -1{
        inorder(ll[node][1])
    }
    print(UnicodeScalar(node+65)!, terminator: "")
    if ll[node][2] != -1{
        inorder(ll[node][2])
    }
}

func postorder(_ node: Int){
    if ll[node][1] != -1{
        postorder(ll[node][1])
    }
    if ll[node][2] != -1{
        postorder(ll[node][2])
    }
    print(UnicodeScalar(node+65)!, terminator: "")
}

preorder(0)
print()
inorder(0)
print()
postorder(0)
print()
