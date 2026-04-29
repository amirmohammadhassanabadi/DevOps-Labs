from flask import Flask
import redis

app = Flask(__name__)

# Connect to Redis (container name or localhost)
r = redis.Redis(host="redis", port=6379, decode_responses=True)

@app.route("/")
def index():
    # increment counter
    count = r.incr("page_views")
    return f"<h1>Page views: {count}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
