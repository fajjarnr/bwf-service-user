const { User } = require("../../../models");
const bcrypt = require("bcryptjs");
const Validator = require("fastest-validator");
const { use } = require("../../users");
const v = new Validator();

module.exports = async (req, res) => {
  const schema = {
    name: {
      type: "string",
      min: 3,
      max: 255,
      empty: false,
    },
    email: {
      type: "email",
      empty: false,
    },
    password: {
      type: "string",
      min: 6,
    },
    profession: {
      type: "string",
      optional: true,
    },
    avatar: {
      type: "string",
      optional: true,
    },
  };

  const validate = v.validate(req.body, schema);

  if (validate.length) {
    return res.status(400).json({
      status: "error",
      message: validate,
    });
  }

  const id = req.params.id;

  const user = await User.findByPk(id);

  if (!user) {
    return res.status(404).json({
      status: "error",
      message: "user not found",
    });
  }

  const { email, password, name, profession, avatar } = req.body;

  if (email) {
    const checkEmail = await User.findOne({
      where: { email },
    });

    if (checkEmail && email !== user.email) {
      return res.status(409).json({
        status: "error",
        message: "email alredy exist",
      });
    }
  }

  const hashPassword = await bcrypt.hash(password, 10);

  await user.update({
    name,
    email,
    hashPassword,
    profession,
    avatar,
  });

  return res.json({
    status: "success",
    data: {
      id: user.id,
      name,
      email,
      profession,
      avatar,
    },
  });
};
