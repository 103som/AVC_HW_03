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
