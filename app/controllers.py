from flask import Flask, jsonify
from app.services import fetch_and_sort_people, fetch_person

app = Flask(__name__)

# app/controllers.py
@app.route('/people', methods=['GET'])
def get_sorted_people():
    try:
        people = fetch_and_sort_people()
        return jsonify(people), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
# Existing imports and code
@app.route('/people/<int:id>', methods=['GET'])
def get_person(id):
    try:
        person = fetch_person(id)
        return jsonify(person), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500
