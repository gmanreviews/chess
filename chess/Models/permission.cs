using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class permission
    {
        private int id;
        public string permission_name;
        public bool create;
        public bool read;
        public bool update;
        public bool delete;

        public permission() { }
        public permission(int id)
        {
            this.id = id;
        }
        public permission(int id, string permission_name, bool create, bool read, bool update, bool delete)
        {
            this.id = id;
            this.permission_name = permission_name;
            this.create = create;
            this.read = read;
            this.update = update;
            this.delete = delete;
        }
    }

    public class permission_model
    {

    }
}