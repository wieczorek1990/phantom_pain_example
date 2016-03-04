#!/usr/bin/env bash

if [ ${EUID} -eq 0 ]
then
  sudo=
else
  sudo=sudo
fi

${sudo} service tor start
bundle exec rerun ruby main.rb

