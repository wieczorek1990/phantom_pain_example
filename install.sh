#!/usr/bin/env bash

if [ ${EUID} -eq 0 ]
then
  sudo=
else
  sudo=sudo
fi

${sudo} apt-get install -y build-essential curl git libfontconfig1 ruby ruby-dev tor zlib1g-dev
${sudo} gem install bundler
bundle install --path vendor/bundle

${sudo} cp torrc /etc/tor/torrc
${sudo} mkdir /etc/tor/cookie/
${sudo} chmod 777 /etc/tor/cookie/

