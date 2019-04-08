#!/bin/bash
echo "Create password"
randpw(){ < /dev/urandom tr -dc '+^_|=12345!/@\-&#$%qwertQW*ERTasdfgASDFGzxcvbZXCVB' | head -c64;echo; }
var=$(randpw)
echo "DJANGO_PASSWORD='$var'" > basic_system/credentials.py
echo "Delete old database and migrations. . ."
rm db.sqlite3
rm -rf basic_system/migrations
rm -rf basic_system/__pycache__
echo -e "Done\n"
echo "Create migrations and database. . ."
source virtualenv/bin/activate
./manage.py makemigrations basic_system
./manage.py migrate
echo -e "Done\n"
echo "Create superuser"
./manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '12345678a')"
./manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_user('user', 'user@example.com', '12345678a')"
echo -e "Done\n"
