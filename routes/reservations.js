const router = require("express").Router();
const req = require("express/lib/request");
//
const pool = require("../database");
//
const { isNotLoggedIn, isLoggedIn } = require("../lib/auth");

router.get("/reservations", isNotLoggedIn, (req, res) => {
  res.render("reservations/reservations", {
    title: "Reservaciones",
  });
});

router.post("/reservations", isNotLoggedIn, async (req, res) => {
  const { destination, check_in, check_out } = req.body;
  const reservation = {
    destination,
    check_in,
    check_out,
    user: req.user.id,
  };
  await pool.query("INSERT INTO reservations SET ?", [reservation]);
  req.flash("success", "Reservación hecha exitosamente");
  res.redirect("/users-reservations");
});

router.get("/users-reservations", isNotLoggedIn, async (req, res) => {
  const reservations = await pool.query(
    "SELECT * FROM reservations WHERE user = ?",
    [req.user.id]
  );
  console.log(reservations);
  res.render("reservations/users-reservations", {
    title: "Mis reservaciones",
    reservations: reservations,
  });
});

router.get("/delete/:id", async (req, res) => {
  const { id } = req.params;
  await pool.query("DELETE FROM reservations WHERE id = ?", [id]);
  req.flash("success", "Reservación elimida con exito");
  res.redirect("/users-reservations");
});

module.exports = router;
