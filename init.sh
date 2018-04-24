sudo rm -rf /etc/nginx/sites-enabled/test.conf
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo rm -r /etc/gunicorn.d/hello
sudo ln -s /home/box/web/etc/hello.py /etc/gunicorn.d/hello

sudo rm -r /etc/gunicorn.d/gunicorn
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/gunicorn

sudo /etc/init.d/gunicorn restart -c  /etc/gunicorn.d/hello.py hello:app
sudo /etc/init.d/mysql start
