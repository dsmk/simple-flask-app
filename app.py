# Simple python flask app

from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "<p>Hello, World!</p>\n"

@app.route('/get/<int:x>/<int:y>')
def get_data(x, y):
    total = x + y  # Simulate data processing
    return f"<p>Sum of {x} and {y} is {total}</p>\n"

@app.route('/health')
def health_check():
    return "<p>OK</p>\n", 200
