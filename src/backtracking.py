def combinations_bk(n: int, k: int, p: list, d : int):
    if k == d:
        print(p[1:k+1])
    else:
        if d == 0:
            s =1
        else:
            s = p[d] + 1
        for i in range(s, n+1):
            p[d+1] = i
            combinations_bk(n, k, p, d+1)


if __name__ == '__main__':
    n = int(input()); k = int(input())
    P = [None] * (k+1)
    combinations_bk(n, k, P, 0)