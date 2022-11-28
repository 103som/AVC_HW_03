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
# Загружаем "r" и сохраняем по метке .LC6.
.LC6:
	.string	"r"
	.align 8
# Загружаем "Неправильно введено имя входного файла." и сохраняем по метке .LC7.
.LC7:
	.string	"\320\235\320\265\320\277\321\200\320\260\320\262\320\270\320\273\321\214\320\275\320\276 \320\262\320\262\320\265\320\264\320\265\320\275\320\276 \320\270\320\274\321\217 \320\262\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260."
# Загружаем "w" и сохраняем по метке .LC8.
.LC8:
	.string	"w"
	.align 8
# "Неправильно введено имя выходного файла.".
.LC9:
	.string	"\320\235\320\265\320\277\321\200\320\260\320\262\320\270\320\273\321\214\320\275\320\276 \320\262\320\262\320\265\320\264\320\265\320\275\320\276 \320\270\320\274\321\217 \320\262\321\213\321\205\320\276\320\264\320\275\320\276\320\263\320\276 \321\204\320\260\320\271\320\273\320\260."
# Загружаем "%lf" и сохраняем по метке .LC10.
.LC10:
	.string	"%lf"
# Загружаем "%f" и сохраняем по метке .LC7.
.LC12:
	.string	"%f"

	.text                                       # Начало секции.
	.globl	main                                # Объявляем и экспортируем main.
	.type	main, @function                     # Отмечаем, что это функция.
main:
	push	rbp                                 # Стандартный пролог функции(заталкивает rbp на стек).
	mov	rbp, rsp                            # Стандартный пролог функции(копирование переданного значения rsp в rbp).
	sub	rsp, 48                             # Стандартный пролог функции(выделяем 48 байт на стеке).
	
	# 8 - ans
	# 16 - in
	# 24 - out
	# 32 - precision
	# 36 - argc
	# 48 - argv
	
	mov	DWORD PTR -36[rbp], edi             # argc.
	mov	QWORD PTR -48[rbp], rsi             # argv.
	
	movsd	xmm0, QWORD PTR .LC4[rip]           # xmm0 := 0.0001
	movsd	QWORD PTR -32[rbp], xmm0            # Перемещаем xmm0 в rbp - 32 (precision = 0.0001).
	
	movsd	xmm0, QWORD PTR .LC5[rip]           # xmm0 := 3.14
	movsd	QWORD PTR -8[rbp], xmm0             # Перемещаем xmm0 в rbp - 8 (ans = 3.14).
	
	# argv[1]
	mov	rax, QWORD PTR -48[rbp]             # Перемещаем rbp - 48 в rax.
	add	rax, 8                              # rax += 8.
	mov	rax, QWORD PTR [rax]                #
	
	lea	rdx, .LC6[rip]                      # rdx := "r".
	mov	rsi, rdx                            # rsi := rdx (2 аргумент для fopen).
	mov	rdi, rax                            # rdi := rax (1 аргумент для fopen).
	call	fopen@PLT                           # Вызов fopen.
	
	mov	QWORD PTR -16[rbp], rax             # Перемещаем rax в rbp - 16 (in = fopen(argv[1], "r")).
	cmp	QWORD PTR -16[rbp], 0               # Сравнение in = fopen(argv[1], "r") и NULL.
	jne	.L6                                 # Если (in = fopen(argv[1], "r") != NULL), то переходим к метке .L6.
	
	lea	rax, .LC7[rip]                      # rax := "Неправильно введено имя входного файла.".
	mov	rdi, rax                            # rdi := rax (1 аргумент для puts).
	call	puts@PLT                            # Вызов puts.
	mov	eax, 1                              # return 1.
	jmp	.L9                                 # Переход к метке .L9.
.L6:
	# argv[2]
	mov	rax, QWORD PTR -48[rbp]             # Перемещаем rbp - 48 в rax.
	add	rax, 16                             # rax += 16.
	mov	rax, QWORD PTR [rax]                #
	
	lea	rdx, .LC8[rip]                      # rdx := "w".
	mov	rsi, rdx                            # rsi := rdx (2 аргумент для fopen).
	mov	rdi, rax                            # rdi := rax (1 аргумент для fopen).
	call	fopen@PLT                           # Вызов fopen.
	
	mov	QWORD PTR -24[rbp], rax             # Перемещаем rax в rbp - 24 (out = fopen(argv[2], "w")).
	cmp	QWORD PTR -24[rbp], 0               # Сравнение out = fopen(argv[2], "w") и NULL.
	jne	.L8                                 # Если (out = fopen(argv[2], "w") != NULL), то переходим к метке .L8.
	
	lea	rax, .LC9[rip]                      # rax := "Неправильно введено имя выходного файла."
	mov	rdi, rax                            # rdi := rax (1 аргумент для puts).
	call	puts@PLT                            # Вызов puts.
	
	mov	eax, 1                              # eax := 1 (return 1).
	jmp	.L9                                 # Переход к метке .L9.
.L8:
	lea	rdx, -32[rbp]                       # rdx := rbp - 32 (3 аргумент для fscanf).
	mov	rax, QWORD PTR -16[rbp]             # Перемещаем rbp - 16 в rax (rax := in).
	lea	rcx, .LC10[rip]                     # rcx := "%lf".
	mov	rsi, rcx                            # rsi := rcx (2 аргумент для fscanf).
	mov	rdi, rax                            # rdi := rax (1 аргумент для fscanf).
	mov	eax, 0                              # eax := 0.
	call	__isoc99_fscanf@PLT                 # Вызов fscanf.
	
	movsd	xmm0, QWORD PTR -32[rbp]            # Перемещаем rbp -32 в xmm0 (xmm0 := precision).
	movsd	xmm1, QWORD PTR .LC11[rip]          # xmm1 := 100.0
	divsd	xmm0, xmm1                          # xmm0 /= xmm1.
	movsd	QWORD PTR -32[rbp], xmm0            # Перемещаем xmm0 в rbp - 32 (precision = precision / 100.0).
	mov	rax, QWORD PTR -32[rbp]             # Перемещаем rbp - 32 в rax.
	movq	xmm0, rax                           # xmm0 := rax (аргумент для findPI).
	call	findPI                              # Вызов findPI.
	
	movq	rax, xmm0                           # rax := xmm0 (возвращаем результат функции).
	mov	QWORD PTR -8[rbp], rax              # Перемещаем rax в rbp - 8 (ans = findPI(precision)).
	mov	rdx, QWORD PTR -8[rbp]              # Перемещаем rbp - 8 в rdx (ans).
	mov	rax, QWORD PTR -24[rbp]             # Перемещаем rbp - 24 в rax (out).
	movq	xmm0, rdx                           # xmm0 := rdx (3 аргумент для fprintf).
	lea	rdx, .LC12[rip]                     # rdx := "%f".
	mov	rsi, rdx                            # rsi := rdx (2 аргумент для fprintf).
	mov	rdi, rax                            # rdi := rax (1 аргумент для fprintf).
	mov	eax, 1                              # eax := 1.
	call	fprintf@PLT                         # Вызов fprintf.
	
	mov	eax, 0                              # eax := 0 (return 0).
# Завершение программы.
.L9:
	leave
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
# 100.0
.LC11:
	.long	0
	.long	1079574528
	.align 8
