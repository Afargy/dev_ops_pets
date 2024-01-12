#!/bin/bash

chmod +x *.sh
chmod +x *.conf

source color.conf

if [[ $# == 0 ]]; then
  source ./check_colors.sh 
  source ./set_colors.sh $column1_background $column1_font_color $column2_background $column2_font_color
  source ./system_data.sh
else 
  echo "This script has no arguments"
fi