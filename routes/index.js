const router = require("express").Router();
//

router.get("/", (req, res) => {
  res.render("index", { title: "Panamá Turistica" });
});

router.get("/foods", (req, res) => {
  res.render("foods", { title: "Comidas de Panamá" });
});

router.get("/hotels", (req, res) => {
  res.render("hotels", { title: "Hoteles en Panamá" });
});

router.get("/provinces", (req, res) => {
  res.render("provinces", { title: "Provinciad de Panamá" });
});

router.get("/gallery", (req, res) => {
  res.render("gallery", { title: "Galería" });
});

module.exports = router;
