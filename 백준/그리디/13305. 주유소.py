n = int(input())
road = list(map(int, input().split()))
cost = list(map(int, input().split()))

i = 0
result = 0
while i < (n-1):
    result += cost[i] * road[i]
    cur_cost = cost[i]

    while cur_cost < cost[i+1]:
        i += 1
        result += cur_cost * road[i]
        if i == (n - 2): break

    i += 1
print(result)
