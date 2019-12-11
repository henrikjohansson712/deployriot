#!/usr/bin/env bash

	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=scicat05.esss.lu.se" -days 3650
	kubectl create secret -ndev tls riotservice --key tls.key --cert tls.crt
	rm tls.*

	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=scicat06.esss.lu.se" -days 3650
	kubectl create secret -nqa tls riotservice --key tls.key --cert tls.crt
	rm tls.*

	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=scichat.esss.lu.se" -days 3650
	kubectl create secret -nproduction tls riotservice --key tls.key --cert tls.crt
	rm tls.*
