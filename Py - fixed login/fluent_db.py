import mysql.connector
import random
class fluent_db:
    def __init__(self, host, user, password):
        self.mysql = mysql.connector.connect( host=host, user = user, password = password,auth_plugin='mysql_native_password')

    def execute(self, command):
        cursor = self.mysql.cursor()
        cursor.execute(command)
        self.mysql.commit()
        cursor.close()
    def fetch(self, command):
        cursor = self.mysql.cursor()
        cursor.execute(command)
        rep = cursor.fetchall()
        cursor.close()
        return rep
    def get_users(self):
        users = self.fetch("SELECT * FROM fluent.users")
        result = []
        id = 0
        for user in users:
            newuser = {}
            newuser["id"] = id
            newuser['name'] = user[1]
            newuser['imageURLS'] = ["https://picsum.photos/400/"+str(random.randint(300, 400))]
            newuser['nlanguage'] = user[5]
            newuser['bio'] = user[6]
            lans = self.get_user_languages(user[0])
            newuser['tlanguages'] = [lan.language for lan in lans]
            newuser["x"] = 0.0
            newuser["y"] = 0.0
            newuser["degree"] = 0.0
            #newuser['lanSkills'] = {lan.language: lan.fluency for lan in lans}
            id+=1
            result.append(newuser)
        return result

    def get_languages(self):
        cmd = "SELECT * FROM fluent.languages"
        return self.fetch(cmd)

    def get_user(self, email):
        cmd = "select * from fluent.users WHERE email = '" + email + "'"
        users = self.fetch(cmd)
        if len(users) > 0:
            return users[0] ##EA it returns as a (,,,)
        else:
            return
    def get_language_id(self, language):
        cmd = "SELECT id FROM fluent.languages where language = '"+language+"' or abb = '"+language+"'"
        return self.fetch(cmd)[0][0]

    def get_user_skills(self, uid, lid):
        cmd = "SELECT * FROM fluent.user_lang where u_id=%s and l_id=%s" %(uid, lid)
        return self.fetch(cmd)[0]

    def get_user_languages(self, uid):
        cmd = """SELECT l_id, language, fluency FROM 
                (SELECT u_id, l_id ,fluency, language FROM fluent.user_lang 
                JOIN fluent.languages where languages.id = user_lang.l_id) as t1 
                WHERE t1.u_id =  """ + str(uid)
        langs = self.fetch(cmd)
        return [{"id": lan[0], "name": lan[1], "fluency": lan[2], "fluency": lan[3]} for lan in langs]

    def insert_user(self, email, name, password, phone):
        cmd  = """insert into fluent.users(name, password, email, phonenumber) 
           values('%s', '%s', '%s', '%s'); """ %(name, password, email, phone)
        self.execute(cmd)

    def insert_user_skill(self, uid, native, lan, fluency, userlancol):
        lanID = self.get_language_id(lan)
        currentSkill = self.get_user_skills(uid, lanID)
        if currentSkill:
            cmd = "update fluent.user_lang SET fluency="+fluency+", native="+native+", userlanguagescol={userlancol} WHERE id=" +currentSkill["id"]
        else:
            cmd = """"insert into fluent.user_lang(u_id, l_id, fluency, native, userlanguagescol)" +
                    "values(%s, %s, %s, %s, %s); """ %(uid, lanID, str(fluency), native, userlancol)
        self.execute(cmd)