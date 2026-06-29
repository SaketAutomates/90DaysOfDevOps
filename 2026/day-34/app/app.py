from flask import Flask
import psycopg2
import redis

app = Flask(__name__)

@app.route("/")
def hello():
    # Connect to Postgres
    try:
        conn = psycopg2.connect(
            dbname="mydb",
            user="myuser",
            password="mypassword",
            host="db"
        )
        conn.close()
        db_status = "Postgres OK"
    except Exception as e:
        db_status = f"DB error: {e}"

    # Connect to Redis
    try:
        r = redis.Redis(host="cache", port=6379)
        r.set("test", "Hello Redis")
        cache_status = r.get("test").decode()
    except Exception as e:
        cache_status = f"Cache error: {e}"

    return f"Hello World! | {db_status} | {cache_status}"
