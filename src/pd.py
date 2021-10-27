def JogoPalito(N, J):
	#n = número de palitos iniciais
	# j = 1/2 (número do jogador)
	#retornar o vencedor forçante (X = jogador X pode forçar a vitória)

	M = [None]*(N+1)
	for i in range(0,N+1):
		M[i] = [-1]*3
	
	for n in range(0, N+1):
		for j in range(1,3):
			#computar M[n][j]
			for i in range(1,min(3,n)+1):
				jv = M[n-i][3-j] #JogoPalito(n-i,3-j)
				if jv == j:
					M[n][j] = j
					break
			if M[n][j] == -1:
				M[n][j] = 3-j
	return M[N][J]

if __name__ == "__main__":
    n = int(input("Digite a quantidade de palitos: "))
    j = int(input("Digite qual o jogador da vez: "))
    if j <= 2 and j >= 1:
        winner_player= JogoPalito(n,j)
        print("Vencedor: {0}".format(winner_player))
    else: raise ValueError("So é possivel prever com dois jogadores")