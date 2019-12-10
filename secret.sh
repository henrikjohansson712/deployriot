#!/usr/bin/env bash
if [ "$#" -ne 1 ]; then
  echo "Usage ./secret.sh ENVIRONMENT" >&2
  exit 1
fi
export env=$1

	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout riot.key -out riot.crt -subj "/CN=scicat01.esss.lu.se" -days 3650


	kubectl create secret -n${env} tls riotservice --key riot.key --cert riot.crt
