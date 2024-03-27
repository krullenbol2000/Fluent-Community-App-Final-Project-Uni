import mysql.connector
class fluent_db:
    def __init__(self, username, password):
        mydb = mysql.connector.connect( host="127.0.0.1", user=username, password=password,auth_plugin='mysql_native_password')
        self.mysql = mydb
    def execute(self, command):
        cursor = self.mysql.connection.cursor()
        cursor.execute(command)
        self.mysql.connection.commit()
        cursor.close()
    def fetch(self, command):
        cursor = self.mysql.connection.cursor()
        cursor.execute(command)
        rep = cursor.fetchall()
        cursor.close()
        return rep

db = fluent_db("root","yabada")
