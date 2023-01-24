from fastapi import FastAPI
from fastapi.responses import HTMLResponse
import os

app = FastAPI()
hostname = os.uname()[1]
@app.get(f'/')
async def index():
    return f'Hello from {hostname}'

@app.get('/json/{name}')
async def index(name:int ):
    return {'Message': f'Hello from {hostname}'}

@app.get('/html/{name}', response_class=HTMLResponse)
async def read_items(name:str):
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
    return HTMLResponse(content=html_content, status_code=200)
