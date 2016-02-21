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
            return View(new user());
        }

        [HttpPost]
        public ActionResult LoginForm(user user)
        {
            if (user_model.login_authenticate(user))
            {
                return RedirectToAction("Index", "User");
            }
            else
            {
                ModelState.AddModelError("error.error", "Bad login");
                user.password = null;
                return View(user);
            }
        }

        public ActionResult signup()
        {
            return View();
        }

        [HttpPost]
        public ActionResult signup(user return_user)//, string username, string password)
        {
            user_model.add_user(return_user);
            return RedirectToAction("Index", "Home");
        }
    }
}