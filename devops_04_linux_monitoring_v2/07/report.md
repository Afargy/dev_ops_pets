## Part 7. Prometheus и Grafana

Сначала запускаем скрипт для установки Prometheus и Grafana\
Пробрасываем порты на виртуальной машине\

- Запускаем веб интерфейс Prometheus
    ![Prometheus interface](img/071.png)

- то же самое для Grafana
    ![Grafana interface](img/072.png)

- Дашборды готовы и установлены
    ![Dashbord is ready](img/073.png)


- Запускаем скрипт из второго задания и проверяем количество памяти на дашборде
    ![Dashbord output after our script](img/074.png)

- Запускаем `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 60s` и проверяем нагрузку CPU
    ![Dashboard output after stress](images/075.png)

