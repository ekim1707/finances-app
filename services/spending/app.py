from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/health", methods=["GET"])
def health_check():
    return jsonify({"status": "ok", "service": "spending"}), 200

@app.route("/api/spending", methods=["GET"])
def get_spending():
    return jsonify({"categories": ["Food", "Rent", "Travel"], "total": 1234.56})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)