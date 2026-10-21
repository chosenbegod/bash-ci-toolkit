#!/bin/bash
# Главный скрипт пайплайна
if [ "$1" = "--version" ]; then
	echo "bash-ci-toolkit 1.0"
	exit 0
fi
if [ -z "$1" ]; then
    echo "Укажи путь к логу"
	exit 3
fi
echo "== Шаг 1: проверка окружения =="
./scripts/deploy_check.sh
code=$?
if [ "$code" -ne 0 ]; then
	echo "Пайплайн остановлен на шаге 1"
	exit "$code"
fi
echo "== Шаг 2: тесты =="
./scripts/run_tests.sh "$1"
code=$?
if [ "$code" -ne 0 ]; then
	echo "Пайплайн остановлен на шаге 2"
	exit "$code"
fi
echo "== Шаг 3: деплой =="
echo "Деплой в $DEPLOY_ENV выполнен"
exit 0
