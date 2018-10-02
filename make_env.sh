#!/bin/bash

echo UID=$(id -u $(whoami)) > .env
echo GID=$(id -g $(whoami)) >> .env
