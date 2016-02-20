using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace chess.Models
{
    public class user
    {
        private int id;
        public string username;
        private string password;
        public string email;
        public person person;

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
            db.disconnect();
            return users;
        }
    }

}