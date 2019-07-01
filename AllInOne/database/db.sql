CREATE DATABASE database_recipes;

USE database_recipes;

CREATE TABLE users (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(16) NOT NULL,
	password VARCHAR(60) NOT NULL,
	fullname VARCHAR(100) NOT NULL
);

DESCRIBE users;

--CATEGORIES TABLE
CREATE TABLE categories (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	category VARCHAR(30) NOT NULL
);

DESCRIBE categories;

--RECIPE TABLE


CREATE TABLE recipes (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	user_id INT(11),
	category_id INT(11),
	description TEXT,
	created_at timestamp NOT NULL DEFAULT current_timestamp,
	CONSTRAINT fk_user FOREIGN KEY  (user_id) REFERENCES users(id),
	CONSTRAINT fk_category FOREIGN KEY  (category_id) REFERENCES categories(id)
);


DESCRIBE recipes;


--FAVORITES TABLE

CREATE TABLE favs (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	user_id INT(11),
	recipe_id INT(11),
	CONSTRAINT fk_user2 FOREIGN KEY  (user_id) REFERENCES users(id),
	CONSTRAINT fk_recipe FOREIGN KEY  (recipe_id) REFERENCES recipes(id)
);

DESCRIBE favorites;

CREATE TABLE measures (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL
);

DESCRIBE measures;

CREATE TABLE ingredients (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	measure_id INT(11),
	CONSTRAINT fk_measure FOREIGN KEY  (measure_id) REFERENCES measures(id)
);

DESCRIBE ingredients;

CREATE TABLE recipeingredients (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	measure_id INT(11),
	ingredient_id INT(11),
	recipe_id INT(11),
	amount INT,
	CONSTRAINT fk_measure2 FOREIGN KEY  (measure_id) REFERENCES measures(id),
	CONSTRAINT fk_ingredient FOREIGN KEY  (ingredient_id) REFERENCES ingredients(id),
	CONSTRAINT fk_recipe2 FOREIGN KEY  (recipe_id) REFERENCES recipes(id)
);

DESCRIBE recipeingredients;

CREATE TABLE steps (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	preparacion TEXT NOT NULL,
	coccion TEXT NOT NULL,
	recipeing_id INT(11),
	CONSTRAINT fk_recipeing FOREIGN KEY  (recipeing_id) REFERENCES recipeingredients(id)
);

DESCRIBE ingredients;