#!/bin/bash
if [ "$#" -eq 0 ]; then
        echo "Укажи путь к логу"
        exit 3
fi
if [ ! -f "$1" ]; then
        echo "Лог не найден"
        exit 2
fi
N=$(grep -c "FAIL" "$1")
if grep -q "FAIL" "$1"; then
        echo "Тесты упали: $N"
	grep "FAIL" "$1" > report.txt
        exit 1
else
        echo "Все тесты прошли"
        exit 0
fi

