def fib(n: int, memory: list)-> int:
    """ assumes n >= 1
        return the n^th fibonacci number
    """
    if memory[n] == -1:
        if n <=2:
            memory[n] = 1
        else:
            memory[n] = fib(n-1, memory) + fib(n-2, memory)
    return memory[n]


if __name__ == '__main__':
    n = int(input("n: "))
    memory = [None]* (n+1)

    for i in range(1, n+1):
        memory[i] = -1

    fib_number = fib(n, memory)
    print(fib_number)