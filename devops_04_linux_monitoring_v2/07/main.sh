#!/bin/bash

sudo apt install prometheus
wget https://dl.grafana.com/oss/release/grafana_9.2.4_amd64.deb 
sudo dpkg -i grafana_9.2.4_amd64.deb 

sudo systemctl enable prometheus 
sudo systemctl start prometheus

sudo systemctl enable grafana-server 
sudo systemctl start grafana-server
