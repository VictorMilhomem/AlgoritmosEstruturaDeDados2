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
def run_combinations():
    n = int(input()); k = int(input())
    P = [None] * (k+1)
    combinations_bk(n, k, P, 0)

##########################################################################

def vogal(l):
	return l=='a' or l=='e' or l=='i' or l=='o' or l=='u' or \
			l=='A' or l=='E' or l=='I' or l=='O' or l=='U'
		   
def generate_passwords(P, k, L):
	if 4 <= k <= 6:
		for i in range(1,k+1):
			print(P[i],end="")
		print()
		
	if k < 6:
		for c in L:
			if (k==0) or (vogal(c) and not vogal(P[k])) or \
				(not vogal(c) and vogal(P[k])):
				P[k+1] = c
				generate_passwords(P, k+1, L)

def run_senhas():
    L = []
    for i in range(ord('A'),ord('Z')+1):
        L.append(chr(i))
    for i in range(ord('a'),ord('z')+1):
        L.append(chr(i))
        
    P = [None]*7
    generate_passwords(P, 0, L)

##########################################################################

def perm(A, n, k, d, P, U):
    if d == k:
        print(P[1:k+1])
    else:
        for i in range(1, n+1):
            if not U[i]:
                P[d+1] = A[i]
                U[i]
                perm(A,n,k,d+1,P,U)
                U[i] = False
def run_perm():
    n = int(input())
    k = int(input())
    A = [0]*(n+1)
    for i in range(1,n+1):
        A[i] = int(input())
    P = [0]*(n+1)
    U = [False]*(n+1)
    perm(A, n, k, 0, P, U)

##########################################################################

def vector_comb(A,n,k,P, d):
    """
    A -> vetor de elementos
    n -> tamanho do vetor
    k -> numero natural
    P -> vetor de partes
    d -> numero de decisões
    retorna todas as combinações dos elementos de A com tamanho k
    """
    if d == k:
        print(P[1:k+1])
    else:
        for i in range(1, n+1):
            can = False
            if d == 0:
                can = True
            else:
                if A[i] > P[d]:
                    can = True
            if can:
                P[d+1] = A[i]
                vector_comb(A, n, k, P, d+1)

def run_vector_comb():
    n = int(input()); k = int(input())
    A = [0]*(n+1)
    for i in range(1,n+1):
        A[i] = int(input())
    P = [None]*(k+1)
    vector_comb(A, n, k, P, 0)

##########################################################################

def n_hook(n, P, k):
    """
    n -> quantidade de torres
    P -> vetor das partes
    k -> numero de decisões tomadas
    retorna todos as posições das torres pacificas
    """
    if k == n:
        for i in range(1,n+1):
            for j in  range(1, n+1):
                if j > 1:
                    print("|", end="")
                if P[i] == j:
                    print("D",end="")
                else:
                    print(" ", end="")
            print()
        print()
        print()
    else:
        for j in range(1, n+1):
            ocorreu = False
            for i in range(1, k+1):
                if P[i] == j:
                    ocorreu = True
                    break
            if not ocorreu:
                P[k+1] = j
                n_hook(n, P, k+1)

def run_n_hook():
    n = int(input())
    P = [None]*(n+1)
    n_hook(n, P, 0)

##########################################################################

def all_binary_size_n(n, P, d):
    """
    n -> tamanho dos binarios a serem gerados
    P -> vetor das partes
    d -> numero de decisões tomadas
    retorna todos os binarios de tamanho n
    """
    if n == d:
        binary = ''
        for i in range(1, n+1):
            binary += P[i]
        print(binary)
    else:
        for i in range(0, 2):
            P[d+1] = str(i)
            all_binary_size_n(n, P, d+1)



def run_all_binary():
    n = int(input())
    P = [None]*(n+1)
    all_binary_size_n(n, P, 0)


##########################################################################

def dice_seq(n, m, P, d):
    """
    n -> quantidade de dados
    m -> quantidade de faces
    P -> vetor das partes
    d -> numero de decisões
    retorna todas as possiveis sequencias de resultados
    """
    if n == d:
        print(P[1:])
    else:
        for i in range(1, m+1):
            P[d+1] = i
            dice_seq(n, m, P, d+1)


def run_dice_seq():
    n = int(input())
    m = int(input())
    P = [None]*(n+1)
    dice_seq(n, m, P, 0)


###########################################################################

def circular_perm(n, P, d):
    """
    n -> numero de pessoas
    P -> vetor das partes
    d-> numero de decisões tomadas
    retorna todas as formas das pessoas sentarem na mesa
    """
    if n == d:
        print(P[1:])

    else:
        for i in range(1, n):
            usado = False
            for j in range(1, d+1):
                if P[j] == i:
                    usado = True
                    break

            if not usado:
                P[d+1] = i
                circular_perm(n, P, d+1)

def run_circular_perm():
    n = int(input())
    P = [None]*(n+1)
    P[1] = n
    circular_perm(n, P, 1)

###########################################################################

def sum_n(n, P, d, sum):
    """
    n -> numero natural
    P -> vetor das partes
    d -> decisões tomadas
    retorna todas as formas de se somar naturais distintos em ordem ascendente com resultado n
    """
    
    if sum == n:
        for i in range(1, d+1):
            if i > 1:
                print("+", end="")
            print(P[i], end="")
        print()
    else:
        for i in range((P[d] if d > 0 else 0)+1, n-sum+1):
            P[d+1] = i
            sum_n(n, P, d+1, sum+i)

def run_sum():
    n = int(input())
    P = [None]*(n+1)
    sum_n(n, P, 0, 0)


if __name__ == '__main__':
    #run_senhas()
    #run_perm()
    #run_vector_comb()
    #run_n_hook()
    #run_all_binary()
    #run_dice_seq()
    #run_circular_perm()
    run_sum()
