#include <stdio.h>
#include <math.h>

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

int main(int argc, char** argv)
{
    // precision - заданная точность, ans - ответ.
    double precision = 0.0001, ans = 3.14;
    
    FILE *in;
    if ((in = fopen(argv[1], "r")) == NULL) {
        puts("Неправильно введено имя входного файла.");
        return 1;
    }
    
    FILE *out;
    if ((out = fopen(argv[2], "w")) == NULL) {
        puts("Неправильно введено имя выходного файла.");
        return 1;
    }
    
    // Ввод точности.
    fscanf(in, "%lf", &precision);
    
    precision = precision / 100.0;
    ans = findPI(precision);
    
    // Вывод точности.
    fprintf(out, "%f", ans);
    
    return 0;
}

