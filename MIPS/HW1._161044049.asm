.data
	arr: .space 1000
	arr2: .space 1000
	arr3:.space 1000
	newline:.asciiz "\n"
	bigarr:.asciiz "The biggest subset is:"
	missing:.asciiz "The biggest subset's  missing characters are:"
	score:.asciiz "-"
.text
	main:
	addi $t0,$zero,0
	addi $t1,$zero,0
	addi $t2,$zero,0
	addi $t3,$zero,0
	addi $s4,$zero,0
	#x seti
	#t0 x setinin iteratorü
	#t1 x setinin uzunluðu
	#s0 x seti
	#t6 x seti bastýrma
	#s1 subsetler
	#t2 subset arrayi uzunluk bulma iteratorü
	#t3 subset array uzunluðu
	#t1 en büyük subset uzunluðu
	#t4 en büyük subset baþlangýç konumu
	#t7 en büyük subset duruþ konumu
 	#x set
 	
loop:
	li $v0,5	
	syscall
	move $s0,$v0
	beq $s0,-1,end
	sw $s0,arr($t0)
	addi $t0,$t0,4
	j loop
end:	
	move $s4,$t0
	addi $s1,$zero,0
	addi $t0,$zero,0
	#Subset
	loop3:
		li $v0,5	
		syscall
		move $s1,$v0
		beq $s1,0,end1
		beq $s1,-1,end2
		sw $s1,arr2($t0)
		addi $t0,$t0,4
		addi $t2,$t2,4
		addi $t3,$t3,4
		j loop3
	
	end1:
		lw $t5,arr2($zero)
		addi $t0,$zero,0
		addi $t7,$zero,0
		add $t7,$t4,$t1
	loop4:
		beq $t4,$t7,end3
		lw $t6,arr2($t4)
		addi $t4,$t4,4
		sw $t6,arr3($t0)
		addi $t0,$t0,4
		j loop4
	end3:
		li $v0,4
		la $a0,bigarr
		syscall
		addi $t7,$zero,0
		loop78:
			beq $t7,$t1,exit12
			lw $s6,arr3($t7)
			li $v0,1
			move $a0,$s6
			syscall
			addi $t7,$t7,4
			j loop78
		exit12:
			move $s7,$t7
			j Search
		
		
	end2:
		blt $t1,$t2,s1
		bgt $t1,$t2,s2	
	s1:
		jal swap
		j loop3
	s2: 
		jal zer
		j loop3	
	swap:
		move $t1,$t2
		sub $t7,$t3,$t1
		move $t4,$t7
		addi $t2,$zero,0
		jr $ra
	zer:
		addi $t2,$zero,0
		jr $ra	
		
		Search:
			li $v0,4
			la $a0,newline
			syscall
			li $v0,4
			la $a0,missing
			syscall
			addi $t0,$zero,0
			addi $t1,$zero,0
			move $t0,$s4
			move $t1,$s7
			addi $t0,$t0,4
			addi $t2,$zero,0
			addi $t3,$zero,0
			addi $t4,$zero,4		
			MainLoop:
				beq $t2,$t0,endMain
				beq $t4,4,go_somewhere
				beq $t4,0,push
				InnerLoop:
					beq $t3,$t1,endInner
			
					lw $t6,arr($t2)
					lw $t5,arr3($t3)
			
					beq $t5,$t6,inc
				
					addi $t3,$t3,4
			
					j InnerLoop
	endMain:
		li $v0,10
		syscall		
			
	inc:
		jal Increase
		j MainLoop
	
	Increase:
		addi $t4,$t4,4
		addi $t2,$t2,4
		addi $t3,$zero,0
		jr $ra
		
	endInner:
		jal ender
		j MainLoop
		
	ender:
		addi $t3,$zero,0
		addi $t2,$t2,4
		jr $ra
		
	go_somewhere:
		jal do_something
		j InnerLoop
	do_something:
		addi $t4,$zero,0
		jr  $ra
	push:
		jal push_f
		j InnerLoop
	push_f:
		addi $t4,$zero,0
		addi $t7,$zero,0
		subi $t7,$t2,4
		lw $s5,arr($t7)
		li $v0,1
		move $a0,$s5
		syscall
		li $v0,4
		la $a0,score
		syscall
		jr $ra
		
		
						
		
	
	
