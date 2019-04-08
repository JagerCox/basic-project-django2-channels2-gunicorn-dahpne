#!/bin/bash
echo " ------------------------------------- "
echo "|  __          _______  _____ _____   |"
echo "|  \ \        / / ____|/ ____|_   _|  |"
echo "|   \ \  /\  / / (___ | |  __  | |    |"
echo "|    \ \/  \/ / \___ \| | |_ | | |    |"
echo "|     \  /\  /  ____) | |__| |_| |_   |"
echo "|      \/  \/  |_____/ \_____|_____|  |"
echo "|                                     |"
echo " ------------------------------------- "
echo "|                                     |"
echo "|    Web Server Gateway Interface     |"
echo "|              GUNICORN               |"
echo "|                                     |"
echo " ------------------------------------- "
echo ""
echo "Activate enviorement"
source virtualenv/bin/activate
echo "Database changes"
./manage.py makemigrations basic_system
./manage.py migrate
echo "Start GUNICORN"
gunicorn basgi.wsgi -b 0.0.0.0:8000 --workers 16
