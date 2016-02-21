﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace chess.Models
{
    public class person
    {
        public int id;
        public string first_name;
        public string last_name;
        public string country;
    }
    public class person_model
    {
        public static person add_person(person person)
        {
            int country_id = add_country(person.country);
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC create_person '" + person.first_name + "','"
                                                                      + person.last_name + "',"
                                                                      + country_id);
            while (reader.Read())
            {
                person.id = int.Parse(reader["result"].ToString());
            }
            reader.Close();
            db.disconnect();
            return person;
        }

        private static int add_country(string country)
        {
            int country_id = 0;
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC create_country '" + country + "'");
            while (reader.Read())
            {
                country_id = int.Parse(reader["result"].ToString());
            }
            reader.Close();
            db.disconnect();
            return country_id;
        }

    }
}