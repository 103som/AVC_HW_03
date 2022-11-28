	.intel_syntax noprefix                      # Используем синтаксис в стиле Intel.
	.text                                       # Начало секции.
	.globl	findPI                              # Объявляем и экспортируем findPI.
	.type	findPI, @function                   # Отмечаем, что это функция.
findPI:
	push	rbp                                 # Стандартный пролог функции(заталкивает rbp на стек).
	mov	rbp, rsp                            # Стандартный пролог функции(копирование переданного значения rsp в rbp).
	sub	rsp, 48                             # Стандартный пролог функции(выделяем 48 байт на стеке).
	
	# 8 - sum
	# 16 - cur
	# 24 - i
	# 40 - precision
	
	# Загрузка параметров в стек.
	movsd	QWORD PTR -40[rbp], xmm0            # (double precision).
	
	pxor	xmm0, xmm0                          # Применяем операцию логического или(получаем xmm0 = 0).
	movsd	QWORD PTR -8[rbp], xmm0             # Перемещаем xmm0 в rbp - 8 (sum = 0).
	
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 := 1.0
	movsd	QWORD PTR -16[rbp], xmm0            # Перемещаем xmm0 в rbp - 16 (cur = 1).
	
	movsd	xmm0, QWORD PTR .LC2[rip]           # xmm0 := 2.0
	movsd	QWORD PTR -24[rbp], xmm0            # (i = 2).
	
	jmp	.L2                                 # Переход к метке .L2(Проверка условия цикла).
.L3:
	movsd	xmm0, QWORD PTR -8[rbp]             # Перемещаем rbp - 8 в xmm0 (xmm0 := sum).
	addsd	xmm0, QWORD PTR -16[rbp]            # xmm0:= xmm0 + (rbp - 16), то есть (sum + cur).
	movsd	QWORD PTR -8[rbp], xmm0             # Перемещаем xmm0 в rbp - 8 (sum := (sum + cur)).
	
	movsd	xmm0, QWORD PTR -24[rbp]            # Перемещаем rbp - 24 в xmm0 (xmm0 := i).
	movapd	xmm1, xmm0                          # Перемещаем xmm0 в xmm1(movapd производит перемещение упакованных выровненных Double).
	mulsd	xmm1, xmm0                          # xmm1 := xmm1 * xmm0 (i * i). 
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 := 1.0
	divsd	xmm0, xmm1                          # xmm0 := xmm0 / xmm1 (1.0 / (i * i)).
	movsd	QWORD PTR -16[rbp], xmm0            # Перемещаем xmm0 в rbp - 16 (cur = 1.0 / (i * i)).
	
	movsd	xmm1, QWORD PTR -24[rbp]            # Перемещаем rbp - 24 в xmm1 (xmm1 := i).
 	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 := 1.0
	addsd	xmm0, xmm1                          # xmm0 += xmm1 (i += 1).
	movsd	QWORD PTR -24[rbp], xmm0            # Перемещаем xmm0 в rvp - 24 (i += 1). 
.L2:
	movsd	xmm0, QWORD PTR -24[rbp]            # Перемещаем rbp - 24 в xmm0 (xmm0 := i).
	movsd	xmm2, QWORD PTR .LC1[rip]           # xmm2 := 1.0
	movapd	xmm1, xmm0                          # Перемещаем xmm0 в xmm1(movapd производит перемещение упакованных выровненных Double).
	subsd	xmm1, xmm2                          # xmm1 := xmm1 - xmm2 (i - 1).
	movsd	xmm0, QWORD PTR .LC1[rip]           # xmm0 := 1.0
	divsd	xmm0, xmm1                          # xmm0 := xmm0 / xmm1 (1.0 / (i - 1)).
	comisd	xmm0, QWORD PTR -40[rbp]            # comisd производит cкалярное сравнение : xmm0 и rbp - 40 (1.0 / (i - 1) и precision).
	ja	.L3                                 # Если (1.0 / (i - 1) > precision), то переходим к метке .L3 (Внутрь цикла).
	
	movsd	xmm1, QWORD PTR -8[rbp]             # Перемещаем rbp - 8 в xmm1 (xmm1 := sum).
	movsd	xmm0, QWORD PTR .LC3[rip]           # xmm0 := 6.
	mulsd	xmm1, xmm0                          # xmm1 *= xmm0 (sum * 6).
	movq	rax, xmm1                           # rax := xmm1.
	movq	xmm0, rax                           # xmm0 := rax. (xmm0 := sum * 6).
	call	sqrt@PLT                            # Вызов функции sqrt. (Для работы данной функции я дополнительно линкую ее с math.h с помощью -lm).
	movq	rax, xmm0                           # rax := xmm0 (rax = sqrt(sum * 6)).
	mov	QWORD PTR -8[rbp], rax              # Перемещаем rax в rbp - 8 (sum = sqrt(sum * 6)).
	movsd	xmm0, QWORD PTR -8[rbp]             # Перемещаем rbp - 8 в xmm0 (xmm0 := sum).
	movq	xmm0, rax                           # xmm0 := rax.
	
	# Выход из функции.
	leave                                       
	ret                                         

# Загружаем "Введите точность." и сохраняем по метке .LC6.
.LC6:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\320\276\321\207\320\275\320\276\321\201\321\202\321\214."

# Загружаем "%lf" и сохраняем по метке .LC7.
.LC7:
	.string	"%lf"

# Загружаем "%f" и сохраняем по метке .LC9.
.LC9:
	.string	"%f"                                #
	
	.text                                       # Начало секции.
	.globl	main                                # Объявляем и экспортируем main.
	.type	main, @function                     # Отмечаем, что это функция.
main:
	push	rbp                                 # Стандартный пролог функции(заталкивает rbp на стек).
	mov	rbp, rsp                            # Стандартный пролог функции(копирование переданного значения rsp в rbp).
	sub	rsp, 16                             # Стандартный пролог функции(выделяем 16 байт на стеке).
	
	# 8 -  ans
	# 16 - precision
	
	movsd	xmm0, QWORD PTR .LC4[rip]           # xmm0 := 0.0001
	movsd	QWORD PTR -16[rbp], xmm0            # Перемещаем xmm0 в rbp - 16 (precision = 0.0001).
	movsd	xmm0, QWORD PTR .LC5[rip]           # xmm0 := 3.14
	movsd	QWORD PTR -8[rbp], xmm0             # Перемещаем xmm0 в rbp - 8 (ans = 3.14).
	
	lea	rax, .LC6[rip]                      # rax := "Введите точность.".
	mov	rdi, rax                            # rdi := rax. (передается в функцию puts).
	call	puts@PLT                            # Вызываем функцию puts.
	
	lea	rax, -16[rbp]                       # Перемещаем rbp - 16 в rax (rax := precision).
	mov	rsi, rax                            # rsi := rax (2 аргумент для передачи в функцию scanf).
	
	lea	rax, .LC7[rip]                      # rax := "%lf".
	mov	rdi, rax                            # rdi := rax (1 аргумент для передачи в функцию scanf).
	mov	eax, 0                              # eax := 0.
	call	__isoc99_scanf@PLT                  # Вызываем scanf.
	
	movsd	xmm0, QWORD PTR -16[rbp]            # Перемещаем rbp - 16 в xmm0 (xmm0 := precision).
	movsd	xmm1, QWORD PTR .LC8[rip]           # xmm1 := 100.0
	divsd	xmm0, xmm1                          # xmm0 /= xmm1 (precision / 100.0).
	movsd	QWORD PTR -16[rbp], xmm0            # Перемещаем xmm0 в rbp - 16 (precision = precision / 100.0).
	
	mov	rax, QWORD PTR -16[rbp]             # Перемещаем rbp - 16 в rax (rax := precision).
	movq	xmm0, rax                           # xmm0 := rax. (аргумент для передачи в функцию findPI).
	call	findPI                              # Вызов findPI.
	
	movq	rax, xmm0                           # rax := xmm0. (rax := findPI(precision)).
	mov	QWORD PTR -8[rbp], rax              # rbp - 8 := rax. (ans = findPI(precision)).
	movq	xmm0, rax                           # xmm0 := rax (2 аргумент для передачи в функцию printf).
	lea	rax, .LC9[rip]                      # rax := "%f".
	mov	rdi, rax                            # rdi := rax (1 аргумент для передачи в функцию printf).
	mov	eax, 1                              # eax := 1.
	call	printf@PLT                          # Вызов printf.
	
	# Завершение программы.
	mov	eax, 0                              # return 0.
	leave                                       #
	ret
	
# Соответсвует значению 1.0(вычислено во время компиляции и сохранено по метке .LC1 в виде IEEE754 64-bit double).
.LC1:
	.long	0                                 
	.long	1072693248
	.align 8            

# Соответсвует значению 2.0(вычислено во время компиляции и сохранено по метке .LC2 в виде IEEE754 64-bit double).
.LC2:
	.long	0                                  
	.long	1073741824                          
	.align 8
	
# Соответсвует значению 6(вычислено во время компиляции и сохранено по метке .LC3 в виде IEEE754 64-bit double).
.LC3:
	.long	0                                   
	.long	1075314688                          
	.align 8

# Соответсвует значению 0.0001(вычислено во время компиляции и сохранено по метке .LC4 в виде IEEE754 64-bit double).
.LC4:
	.long	-350469331                          
	.long	1058682594                          
	.align 8

# Соответсвует значению 3.14(вычислено во время компиляции и сохранено по метке .LC5 в виде IEEE754 64-bit double).
.LC5:
	.long	1374389535                          
	.long	1074339512                          
	.align 8

# Соответсвует значению 100.0(вычислено во время компиляции и сохранено по метке .LC8 в виде IEEE754 64-bit double).
.LC8:
	.long	0                                   
	.long	1079574528                          
	.align 8
