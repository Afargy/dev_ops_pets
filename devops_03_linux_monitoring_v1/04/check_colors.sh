#!/bin/bash

def=0

if [[ ! $column1_background =~ ^[1-6]+$ ]]; then 
  def=1
elif [[ ! $column1_font_color =~ ^[1-6]+$ ]]; then
  def=1
elif [[ ! $column2_background =~ ^[1-6]+$ ]]; then
  def=1
elif [[ ! $column1_background =~ ^[1-6]+$ ]]; then
  def=1
elif [[ $column1_background -eq $column1_font_color ]]; then
  def=1
elif [[ $column2_background -eq $column2_font_color ]]; then
  def=1
fi

if [[ def -eq 1 ]]; then
  column1_background=1
  column1_font_color=2
  column2_background=1
  column2_font_color=2
fi
