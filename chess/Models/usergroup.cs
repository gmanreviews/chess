using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class usergroup
    {
        private int id;
        public string usergroup_name;
        List<permission> permissions;

        public usergroup() { }
        public usergroup(int id)
        {
            this.id = id;
        }
        public usergroup(int id, string usergroup_name, List<permission> permissions)
        {
            this.id = id;
            this.usergroup_name = usergroup_name;
            this.permissions = permissions;
        }
    }
    public class usergroup_model
    {

    }

}