service mysql start
service redis-server start
mysql -uroot -e "create database apisploit; CREATE USER 'apisploit'@'localhost' IDENTIFIED BY 'apisploit123'; GRANT ALL PRIVILEGES ON * . * TO 'apisploit'@'localhost';"
python3 manage.py migrate
celery -A APISPloit worker -l info > celery_log.txt 2>&1 &
/APISPloit/ngrok http 8000 &
python3 manage.py runserver 0.0.0.0:8000