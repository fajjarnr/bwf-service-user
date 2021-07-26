"use strict";

const bcrypt = require("bcryptjs");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert("users", [
      {
        name: "Fajar",
        email: "zfajart@gmail.com",
        profession: "Admin BWF",
        role: "admin",
        password: await bcrypt.hash("fajar123", 10),
        created_at: new Date(),
        updated_at: new Date(),
      },
      {
        name: "Fahrur",
        email: "fahrur@gmail.com",
        profession: "Pelajar",
        role: "student",
        password: await bcrypt.hash("fahrur123", 10),
        created_at: new Date(),
        updated_at: new Date(),
      },
    ]);
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.bulkDelete("users", null, {});
  },
};
