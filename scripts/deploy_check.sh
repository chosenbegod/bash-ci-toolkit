#!/bin/bash
if [ -z "$DEPLOY_ENV" ]; then
echo "Не задана DEPLOY_ENV"
exit 1
fi
if  [ "$DEPLOY_ENV" = "prod" ]; then
echo "Деплой в prod"
exit 0
elif [ "$DEPLOY_ENV" = "staging" ]; then
echo "Деплой в staging"
exit 0
else 
echo "Неизвестное окружение: $DEPLOY_ENV"
exit 2
fi
