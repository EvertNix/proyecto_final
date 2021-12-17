const router = require("express").Router();
const passport = require("passport");

// db
const pool = require("../database");
//
const { isLoggedIn, isNotLoggedIn } = require("../lib/auth");

router.get("/register", isLoggedIn, (req, res) => {
  res.render("auth/register", { title: "Registrate" });
});

router.post(
  "/register",
  passport.authenticate("local.register", {
    successRedirect: "/",
    failureRedirect: "/register",
    failureFlash: true,
  })
);

router.get("/login", isLoggedIn, (req, res) => {
  res.render("auth/login", { title: "Inicia Sesión" });
});

router.post(
  "/login",
  passport.authenticate("local.login", {
    successRedirect: "/",
    failureRedirect: "/login",
    failureFlash: true,
  })
);

router.get("/logout", (req, res) => {
  req.logOut();
  res.redirect("/login");
});

module.exports = router;
