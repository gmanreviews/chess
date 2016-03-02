using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace chess.Models
{
    public class chess_move
    {
        public int id { get; set; }
        public int move_no { get; set; }
        public string move { get; set; }
        public string player { get; set; }

        public chess_move() { }
    }

    public class chess_move_model
    {
        public static chess_move record_move(chess_move move, game game)
        {
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC record_move " + game.id + "," +
                                                                     move.move_no + "," +
                                                               "'" + move.player + "'," +
                                                               "'" + move.move + "'");
            while (reader.Read())
            {
                move.id = int.Parse(reader["id"].ToString());
            }
            reader.Close();
            db.disconnect();
            return move;
        }
        
        public static bool delete_move(game game)
        {
            bool result = false;
            db db = new db();
            db.connect();
            SqlDataReader reader = db.query_db("EXEC delete_last_move " + game.id);
            while (reader.Read())
            {
                result = (bool)reader["result"];
            }
            reader.Close();
            db.disconnect();
            return result;
        }               
    }
}