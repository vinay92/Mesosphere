#!/bin/bash
curl -o oinker.json https://raw.githubusercontent.com/mesosphere/oinker/shakespeare/marathon.json
dcos marathon app add oinker.json
curl -o router.json https://raw.githubusercontent.com/mesosphere/oinker/shakespeare/router/marathon.json
dcos marathon app add router.json
