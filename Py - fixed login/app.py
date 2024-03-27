  from flask import abort, Flask, jsonify, request
from fluent_db import fluent_db
from flask_cors import CORS
import yaml

app = Flask(__name__)

db = yaml.load(open('database.yaml'))

app.config['MYSQL_HOST'] = db['host']
app.config['MYSQL_USER'] = db['user']
app.config['MYSQL_PASSWORD'] = db['pass']
app.config['MYSQL_DB'] = db['db']

CORS(app)

@app.route('/user', methods=['POST'])
def user():
    body = request.form
    try:
        name = body['name']
        email = body['age']
        password = body['password']
        phonenumber = body['ph']
        conn = fluent_db(db["host"],db['user'], db['pass'])
        ##Check if exists
        ##HASHING
        ##Check that all params exist
        conn.insert_user(email, name, password, phonenumber)
        return jsonify({
            'status': 'Success',
            'message': ""
        })
    except Exception as e:
        return jsonify({
            'status': 'Fail',
            'message': ""
        })


@app.route('/users', methods=['GET'])
def users():
    try:
        conn = fluent_db(db["host"],db['user'], db['pass'])
        users = conn.get_users()
        return jsonify({
            'value': users,
            'status': 'Success',
            'message': ""
        })
    except Exception as e:
        print(str(e))
        return jsonify({
            'value': [],
            'status': 'Fail',
            'message': str(e)
        })


@app.route('/login', methods=["POST"])
def login():
    body = request.form
    try:
        email = body['email']
        password = body['pass']
        conn = fluent_db(db["host"], db['user'], db['pass'])
        user = conn.get_user(email)
        if len(user) > 0 and user[2] == password: 
            response = {}
            response["user"] = {"name": user[0], "email": user[3], "phone": user[4]}
            response["languages"] = conn.get_user_languages(user[0])
            return jsonify({
                'status': 'Success',
                'message': response
            })        
        else:
            return jsonify({
            'status': 'Fail',
            'message': "Incorrect Password"
            })
    except Exception as e:
        return jsonify({
            'status': 'Fail',
            'message': str(e)
        })

if __name__ == '__main__':
    app.run(debug = True)