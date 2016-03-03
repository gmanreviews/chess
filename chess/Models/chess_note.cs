using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace chess.Models
{
    public class chess_note
    {
        public int id { get; set; }
        public string note { get; set; }
        public user author { get; set; }
        public bool important { get; set; }

        public chess_note() { }
        public chess_note(int id)
        {
            this.id = id;
        }
        public chess_note(int id, string note)
        {
            this.id = id;
            this.note = note;
        }
        public chess_note(string note)
        {
            this.note = note;
        }
    }
    public class chess_note_model
    {
        public static chess_note add_note(game game, chess_move move, chess_note note)
        {
            string type;
            if (game != null && move != null) throw new Exception("must have only game or only move, not both.");
            else if (game != null) type = "g";
            else if (move != null) type = "m";
            else throw new Exception("must have either a game or move to attach note to.");

            note = create_note(note);
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC add_note '" + type + "',"
                                                                 + game.id + ","
                                                                 + move.id + ","
                                                                 + note.id);
            reader.Close();
            db.disconnect();

            return note;
        }

        private static chess_note create_note (chess_note note)
        {
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC create_note '" + note.note + "'");
            while (reader.Read())
            {
                note.id = int.Parse(reader["id"].ToString());
            }
            reader.Close();
            db.disconnect();
            return note;
        }
    }
}