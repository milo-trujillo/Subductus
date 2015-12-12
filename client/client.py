import socket
import threading
import sys
##raw_input("say hai -- >")
host = '128.113.138.14'
port = 2345

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((host,port))

def userInputListener():
    while True:
        typedStuff = sys.stdin.readline()
        sock.sendall(typedStuff)
        sys.stdout.flush()
thread1 = threading.Thread(target = userInputListener,args = ())
thread1.daemon = True
thread1.start()

while True:
    serverStuff = sock.recv(1024)
    sys.stdout.write(serverStuff)
    sys.stdout.flush()


