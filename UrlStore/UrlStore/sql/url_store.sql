CREATE DATABASE `url_store`;

USE `url_store`;

CREATE TABLE `user` (
  `id` SERIAL,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(64),
  `password` VARCHAR(255),
  `created_at` DATE DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATE NULL,
  CONSTRAINT `user_id_pk` PRIMARY KEY (`id`),
  CONSTRAINT `user_email_uk` UNIQUE (`email`)
)ENGINE=InnoDB;


CREATE TABLE `url` (
  `id` SERIAL,
  `name` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `created_at` DATE DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATE NULL,
  CONSTRAINT `url_id_pk` PRIMARY KEY (`id`),
  CONSTRAINT `url_user_id_fk` FOREIGN KEY (user_id) REFERENCES user(id)
)ENGINE=InnoDB;
