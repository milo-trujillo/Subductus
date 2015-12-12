import socket

host = '128.113.138.14'
port = 2345

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((host,port))

def userInputListener():
    while true:
        typedStuff = raw_input("::")
        print typedStuff

thread1 = threading.Thread(target = userInputListener)
thread1.start

while true:
    serverStuff = sock.read(1024)
    print serverStuff



