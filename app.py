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

@app.route('/ten/<int:x>')
def ten_times(x):
    total = x * 10 # Simulate data processing
    return f"<p>Ten times {x} is {total}</p>\n"

# Uncomment this when you want to add a health check endpoint
@app.route('/health')
def health_check():
    return "<p>OK</p>\n", 200
