import multiprocessing

bind = "localhost:8080"
workers = multiprocessing.cpu_count() * 2 + 1
