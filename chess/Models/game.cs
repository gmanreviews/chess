using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class game
    {
        public int id { get; set; }
        public string title { get; set; }
        public string tournament { get; set; }
        public DateTime gametime { get; set; }
        public person white_player { get; set; }
        public person black_player { get; set; }
        public List<chess_move> moves { get; set; }
        public List<chess_note> notes { get; set; }
    }
    public class game_model
    {
        public static game create_game (game game)
        {

            return game;
        }
    }
}