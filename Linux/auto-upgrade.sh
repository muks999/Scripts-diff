#!/bin/bash

# Скрипт для автоматического обновления и очистки Debian
# Сохраните как /usr/local/bin/auto-upgrade.sh и сделайте исполняемым:
# sudo chmod +x /usr/local/bin/auto-upgrade.sh
# Добавьте в cron: sudo crontab -e -> 0 3 * * 6 /usr/local/bin/auto-upgrade.sh

echo "$(date): Начало автоматического обновления системы"

# Обновление списка пакетов
apt-get update

# Установка обновлений безопасности (без лишних вопросов)
apt-get upgrade -y

# Установка обновлений с изменением зависимостей (более тщательное)
apt-get dist-upgrade -y

# Удаление ненужных пакетов
apt-get autoremove -y
apt-get autoclean -y

# Очистка кеша пакетов (опционально, экономим место)
# apt-get clean

echo "$(date): Автоматическое обновление завершено успешно"

# Можно добавить уведомление (если установлен mailutils или другой инструмент)
# echo "Система $(hostname) успешно обновлена" | mail -s "Отчет об обновлении" admin@example.com
