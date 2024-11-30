## Task 11

### Script Functionality

  Build Docker Image: The script builds a Docker image for your API service.
  Run N Instances: It dynamically starts N instances of the service using Docker containers, each mapped to a unique port.
  Register Instances: The script collects the list of instance URLs and exports them for later use in traffic balancing.
    Handle Incoming Requests:
    Incoming requests are received by socat running on a specified port (8014).
    A random instance from the pool is selected to handle each incoming request, achieving basic load balancing.

### Script Usage
```bash
   chmod +x run_instances.sh
```
Run the script by specifying the number of instances to start (e.g., 5):
```bash
  ./run_instances.sh 5
```
### Output
```bash
62947af8d2a0   api_for_11_task   "python manage.py ru…"   14 seconds ago   Up 14 seconds   0.0.0.0:9105->8000/tcp, [::]:9105->8000/tcp   api5
3750ce6754d7   api_for_11_task   "python manage.py ru…"   15 seconds ago   Up 14 seconds   0.0.0.0:9104->8000/tcp, [::]:9104->8000/tcp   api4
aaba3e28be10   api_for_11_task   "python manage.py ru…"   15 seconds ago   Up 14 seconds   0.0.0.0:9103->8000/tcp, [::]:9103->8000/tcp   api3
591e21c942dd   api_for_11_task   "python manage.py ru…"   15 seconds ago   Up 14 seconds   0.0.0.0:9102->8000/tcp, [::]:9102->8000/tcp   api2
c781ecdb4439   api_for_11_task   "python manage.py ru…"   15 seconds ago   Up 15 seconds   0.0.0.0:9101->8000/tcp, [::]:9101->8000/tcp   api1
```

```bash
Forwarding to: http://127.0.0.1:9104/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9103/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9105/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9103/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9102/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9102/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9104/
Received request: GET / HTTP/1.1
Forwarding to: http://127.0.0.1:9101/
```

API
```bash
http://localhost:8014/ 
```

