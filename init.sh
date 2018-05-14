sudo rm -rf /etc/nginx/sites-enabled/test.conf
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm -rf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo rm -r /etc/gunicorn.d/hello.py
sudo ln -s /home/box/web/etc/hello.py /etc/gunicorn.d/hello.py

sudo rm -r /etc/gunicorn.d/gunicorn.conf
sudo ln -s /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/gunicorn.conf
  gunicorn
sudo /etc/init.d/mysql start
