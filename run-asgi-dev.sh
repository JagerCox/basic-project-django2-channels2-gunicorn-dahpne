#!/bin/bash
echo " --------------------------------------- "
echo "|               _____  _____ _____      |"
echo "|        /\    / ____|/ ____|_   _|     |"
echo "|       /  \  | (___ | |  __  | |       |"
echo "|      / /\ \  \___ \| | |_ | | |       |"
echo "|     / ____ \ ____) | |__| |_| |_      |"
echo "|    /_/    \_\_____/ \_____|_____|     |"
echo "|                                       |"
echo " --------------------------------------- "
echo "|                                       |"
echo "| Asynchronous Server Gateway Interface |"
echo "|                 DAPHNE                |"
echo "|                                       |"
echo " --------------------------------------- "
echo ""
echo " -------------------------------------------- "
echo "| NOTE: Django Channels 2.x needs a broker   |"
echo "| and a routing.py file                      |"
echo " -------------------------------------------- "
echo "| sudo apt-get install redis-server          |"
echo "| sudo systemctl start redis                 |"
echo "| sudo systemctl enable redis-server.service |"
echo " -------------------------------------------- "
echo ""
echo "Activate enviorement"
source virtualenv/bin/activate
echo "Database changes"
./manage.py makemigrations basic_system
./manage.py migrate
echo "Redis status"
systemctl status redis --no-pager
echo "Start DAPHNE"
daphne basgi.asgi:application -b 0.0.0.0 -p 8001
