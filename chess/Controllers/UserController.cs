using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using chess.Models;

namespace chess.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LoginForm()
        {
            user_model.get_all_users();
            return View(new user());
        }

        [HttpPost]
        public ActionResult LoginForm(user user)
        {
            return View(user);
        }
    }
}