const express = require("express");
const router = express.Router();

const {
  register,
  login,
  update,
  getUser,
  getUsers,
  logout,
} = require("./handler/user");

router.get("/", getUsers);
router.get("/:id", getUser);
router.post("/register", register);
router.post("/login", login);
router.put("/:id", update);
router.post("/logout", logout);

module.exports = router;
