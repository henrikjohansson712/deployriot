#!/usr/bin/env bash

	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout riot-dev.key -out riot-dev.crt -subj "/CN=scicat05.esss.lu.se" -days 3650
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout riot-qa.key -out riot-qa.crt -subj "/CN=scicat06.esss.lu.se" -days 3650
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout riot-production.key -out riot-production.crt -subj "/CN=scichat.esss.lu.se" -days 3650


	kubectl create secret -ndev tls riotservice --key riot-dev.key --cert riot-dev.crt
	kubectl create secret -nqa tls riotservice --key riot-qa.key --cert riot-qa.crt
	kubectl create secret -nproduction tls riotservice --key riot-production.key --cert riot-production.crt
