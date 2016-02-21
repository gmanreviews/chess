using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class chess_note
    {
        private int id { get; set; }
        public string note { get; set; }

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

    }
}