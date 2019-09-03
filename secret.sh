#!/usr/bin/env bash
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout riot.key -out riot.crt -subj "/CN=scicat01.esss.lu.se" -days 3650


	kubectl create secret -ndev tls riotservice --key riot.key --cert riot.crt
