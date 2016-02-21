using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class session
    {
        public static user user_session
        {
            get
            {
                try {
                    if (HttpContext.Current.Session["user"] != null)
                        return (user)HttpContext.Current.Session["user"];
                    else
                        return null;
                }
                catch (Exception)
                {
                    return null;
                }
            }
            set
            {
                HttpContext.Current.Session["user"] = value;
            }
        }
    }
}