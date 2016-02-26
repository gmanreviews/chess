using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace chess.Models
{
    public class post_category
    {
        public int id { get; set; }
        public string category { get; set; }
    }

    public class post_category_model
    {
        public post_category create_post_category(post_category post_category)
        {
            return post_category;
        }
    }
}