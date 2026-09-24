from fastapi import FastAPI
from math_utils import add_numbers, say_hello

app = FastAPI()

@app.get("/")
def root():
    return {"message": "My Super Lib API is running!"}

@app.get("/add/{a}/{b}")
def add(a: int, b: int):
    result = add_numbers(a, b)
    return {"operation": "addition", "a": a, "b": b, "result": result}

@app.get("/hello/{name}")
def hello(name: str):
    greeting = say_hello(name)
    return {"greeting": greeting}