# WSGI приложение должно возвращать документ с MIME-типом text/plain, содержащий все GET параметры, по одному на каждую строку.
#
# Например при запросе  /?a=1&a=2&b=3 приложение должно вернуть такой текст
#
# a=1
# a=2
# b=3

def app(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return [bytes('\r\n'.join(environ['QUERY_STRING'].split('&')), encoding="utf8")]
