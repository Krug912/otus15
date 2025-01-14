#!/bin/bash

# Функция для выполнения команды с заданным уровнем ionice
run_process() {
    ionice_level=$1
    command=$2
    # Запускаем процесс и замеряем время
    { time ionice -c $ionice_level $command; } 2>&1 | tee -a process_$ionice_level.log
}

# Команды для выполнения(например, запись больших файлов)
command1="dd if=/dev/zero of=file1 bs=1M count=3500"
command2="dd if=/dev/zero of=file2 bs=1M count=3500"
command3="dd if=/dev/zero of=file2 bs=1M count=3500"
# Запускаем два процесса с разными уровнями приоритета ionice
run_process 1 "$command1" &  # Класс планирования Real time
run_process 2 "$command2" &  # Класс планирования Best effort
run_process 3 "$command3" &  # Класс планирования Idle
# Ждем завершения обоих процессов
wait

echo "Оба процесса завершены."
