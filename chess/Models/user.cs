using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace chess.Models
{
    public class user
    {
        public int id;
        public string username;
        public string password;
        public string email;
        public person person;
        public List<usergroup> usergroups;

        public user() { }
        public user(int id)
        {
            this.id = id;
        }
        public user(int id, string username, string password, string email, person person)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.email = email;
            this.person = person;
        }
    }
    public class user_model
    {
        public static List<user> get_all_users()
        {
            List<user> users = new List<user>();
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("SELECT * FROM users");
            while (reader.Read())
            {
                users.Add(new user(int.Parse(reader["id"].ToString())));
            }
            reader.Close();
            db.disconnect();
            return users;
        }

        private static string get_password(user user)
        {
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC get_user_password " + user.id + ",'" + user.username + "'");
            while (reader.Read())
            {
                if ((bool)reader["success"])  user.password = reader["password"].ToString();
            }
            reader.Close();
            db.disconnect();
            return user.password;
        }

        public static bool login_authenticate(user user)
        {
            if (user.password == null || get_password(user) == null) return false;
            else return bcrypt.test_password(user.password, get_password(user));
        }

        public static user add_user(user user)
        {
            try {
                user.person = person_model.add_person(user.person);
                db db = new db();
                db.connect();
                SqlDataReader reader = db.query_db("EXEC create_user '" + user.username + "','"
                                                                        + bcrypt.encrypt(user.password) + "','"
                                                                        + user.email + "',"
                                                                        + user.person.id);
                while (reader.Read())
                {
                    if ((bool)reader["success"]) user.id = int.Parse(reader["result"].ToString());
                    else throw new Exception("username not unique");
                }
                reader.Close();
                db.disconnect();
                return user;
            }
            catch (Exception)
            {
                return user;
            }
        }

    }

}