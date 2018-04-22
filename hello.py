# WSGI приложение должно возвращать документ с MIME-типом text/plain, содержащий все GET 
# параметры, по одному на каждую строку.
#
# Например при запросе  /?a=1&a=2&b=3 приложение должно вернуть такой текст
#
# a=1
# a=2
# b=3

import multiprocessing

bind = "0.0.0.0:8000"
workers = multiprocessing.cpu_count() * 2 + 1

def app(environ, start_response):
    """Simplest possible application object"""
    data = 'No queries'
    query_str = environ['QUERY_STRING']
    if query_str:
    	data = query_str.replace('&', '\n')
    status = '200 OK'
    response_headers = [
        ('Content-type','text/plain'),
        ('Content-Length', str(len(data)))
    ]
    start_response(status, response_headers)
    data = bytes(data, 'ascii')
    return iter([data])
