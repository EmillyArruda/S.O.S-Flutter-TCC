"use strict";

const { DataTypes } = require("sequelize");

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return await queryInterface.createTable("accounts", {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: DataTypes.INTEGER,
      },
      email: {
        allowNull: false,
        required: true,
        unique: true,
        isEmail: true,
        type: DataTypes.STRING,
      },
      password: {
        allowNull: false,
        required: true,
        type: DataTypes.STRING,
      },
      passwordResetToken: {
        allowNull: true,
        type: DataTypes.STRING,
      },
      passwordResetExpires: {
        allowNull: true,
        type: DataTypes.DATE,
      },
      createdAt: {
        allowNull: false,
        type: DataTypes.DATE,
      },
      updatedAt: {
        allowNull: false,
        type: DataTypes.DATE,
      },
    });
  },

  down: async (queryInterface, Sequelize) => {
    return await queryInterface.dropTable("accounts");
  },
};
