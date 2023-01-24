#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
#yum install -y httpd
# systemctl start httpd
# systemctl enable httpd
# echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html#

sudo amazon-linux-extras install nginx1


pip3 install fastapi
pip3 install uvicorn

echo "from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import os

app = FastAPI()

@app.get(f'/')
async def index():
    return {'Message': 'Hello World...!'}

@app.get('/json/{name}')
async def index(name:int ):
    return f'hello {name}'

@app.get('/html/{name}', response_class=HTMLResponse)
async def read_items(name:str):
    hostname = os.uname()[1]
    html_content = f'''
    <html>
        <head>
            <title>Abdul's Website</title>
        </head>
        <body>
            <h1>How are you {name.capitalize()}..!</h1>
            <h2>This Response is from Server {hostname}<h2>
        </body>
    </html>
    '''
    return HTMLResponse(content=html_content, status_code=200)" >> main.py

uvicorn main:app --reload --port 80







