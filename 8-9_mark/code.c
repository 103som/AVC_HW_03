#include <stdio.h>
#include <math.h>
#include <time.h>
#include <limits.h>
#include <stdlib.h>

// Вычисление числа PI, с заданной точностью с помощью дзета-функции Римана.
double findPI(double precision) {
    double sum = 0, cur = 1, i = 2;
    
    // Вычисление суммы ряда квадратов.
    for (; 1.0 / (i - 1) > precision; i += 1) {
        sum += cur;
        cur = 1.0 / (i * i);
    }
    
    sum = sqrt(sum * 6);
    
    return sum;
}

double randfrom(double min, double max) 
{
    double range = (max - min); 
    double div = INT_MAX / range;
    return min + (rand() / div);
}

// Требую к передаче 3 аргумента.
// тип операции (0 для данной), имя входного файла, имя выходного файла.
// тип операции (любое другое число/символ для данной), имя выходного файла, параметр для генерации.
int main(int argc, char** argv)
{
    if (argc != 4) {
        puts("Передано неверное число аргументов командной строки.");
        return 0;
    }
    
    // precision - заданная точность, ans - ответ.
    double precision = 0.0001, ans = 3.14;
    
    if (atoi(argv[1]) == 0) {
        FILE *in;
        if ((in = fopen(argv[2], "r")) == NULL) {
            puts("Неправильно введено имя входного файла.");
            return 0;
        }
        
        FILE *out;
        if ((out = fopen(argv[3], "w")) == NULL) {
            puts("Неправильно введено имя выходного файла.");
            return 0;
        }
        
        // Ввод точности.
        fscanf(in, "%lf", &precision);    
        
        double time_spent = 0.0;
        clock_t begin = clock();
        
        precision = precision / 100.0;
        ans = findPI(precision);


        clock_t end = clock();
        time_spent += (double)(end - begin) / CLOCKS_PER_SEC;

        printf("Time %f \n", time_spent);

        // Вывод точности.
        fprintf(out, "%f", ans);
        
        return 0;
    }
    
    FILE *out;
    if ((out = fopen(argv[2], "w")) == NULL) {
        puts("Неправильно введено имя выходного файла.");
        return 0;
    }
    
    double time_spent = 0.0;
    clock_t begin = clock();
    
    int seed = atoi(argv[3]);
	srand(seed);
    precision = randfrom(0.1, 0.6);
    
    precision = precision / 100.0;
    ans = findPI(precision);

    clock_t end = clock();
    time_spent += (double)(end - begin) / CLOCKS_PER_SEC;
    
    printf("Time %f \n", time_spent);
    
    fprintf(out, " %f ", precision);
    fprintf(out, " %f ", ans);
    return 0;
}

