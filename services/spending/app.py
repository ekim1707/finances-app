from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/api/spending", methods=["GET"])
def get_spending():
    return jsonify({"categories": ["Food", "Rent", "Travel"], "total": 1234.56})

if __name__ = "__main__":
    app.run(host="0.0.0.0", port=5000)