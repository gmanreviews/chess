using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using chess.Models;

namespace chess.Controllers
{
    public class PostCategoryController : Controller
    {

        public ActionResult dropdown()
        {
            return View(post_category_model.get_post_categories());
        }

        public JsonResult json_return()
        {
            return Json(new { response = post_category_model.get_post_categories() }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult auto_fill()
        {
            return View();
        }
    }
}