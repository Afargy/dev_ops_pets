## Part 7. Prometheus и Grafana

Сначала запускаем скрипт для установки Prometheus и Grafana\
Пробрасываем порты на виртуальной машине\

- Дашборд Node Exporter Quickstart and Dashboard
    ![Prometheus interface](img/081.png)

- Запускаем скрипт из второго задания и проверяем количество памяти на дашборде
    ![Grafana interface](img/082.png)

- Запускаем `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 60s` и проверяем нагрузку CPU
    ![Dashbord is ready](img/083.png)

- Нагрузка на сеть с помощью iperf3
    ![Dashbord output after our script](img/084.png)

