.data

.text

.globl main

main:
	li $t0, 0 # armazena 0 em $t0 para verificar se N é válido
	
read:
 	li $v0, 5 # syscall para ler inteiro
       	syscall
       	
       	move $t0, $v0 # armazena N em $t0
       	blez $t0, read # se N <= 0, pule para ler novamente
       	
       	li $t1, 1 # armazena 1 em $t1 para iniciar a soma
       	li $t2, 0 # armazena 0 em $t2 para armazenar o resultado da soma
loop:
       	beq $t1, $t0, end # se o contador == N, pule para o final
       	add $t2, $t2, $t1 # adiciona o contador ao resultado da soma
       	
       	addi $t1, $t1, 1 # incrementa o contador
       	
       	j loop # pula para o início do loop
end:
       	add $t2, $t2, $t1 # adiciona o último número (N) ao resultado da soma
       	
       	move $a0, $t2 # move o resultado da soma para $a0 para imprimir
       	li $v0, 1 # syscall para imprimir inteiro
       	syscall
       	
       	li $v0, 10 # syscall para sair
       	syscall
