const express = require("express");
const router = express.Router();

const { create, getToken } = require("./handler/refresh-tokens");

router.post("/", create);
router.get("/", getToken);

module.exports = router;
