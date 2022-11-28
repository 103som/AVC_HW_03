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

int main()
{
    // precision - заданная точность, ans - ответ.
    double precision = 0.0001, ans = 3.14;
    
    puts("Введите точность.");
    
    // Ввод точности.
    scanf("%lf", &precision);
    
    precision = precision / 100.0;
    ans = findPI(precision);
    
    // Вывод точности.
    printf("%f", ans);
    
    return 0;
}

