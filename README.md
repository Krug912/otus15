# Работа с процессами
4. Реализовать 2 конкурирующих процесса по IO. пробовать запустить с разными ionice  
- Результат ДЗ - скрипт запускающий 2 процесса с разными ionice, замеряющий время выполнения и лог консоли  
Скрипт запускает по очереди 3 процесса с разным классом планирования. Результаты перенаправляются в process_%.log где % идентификтор классом планирования.
