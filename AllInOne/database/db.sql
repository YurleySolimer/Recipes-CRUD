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
	steps VARCHAR(500),
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

DESCRIBE favs;

CREATE TABLE measures (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	measure VARCHAR(30) NOT NULL UNIQUE
);

DESCRIBE measures;

CREATE TABLE ingredients (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE
);

DESCRIBE ingredients;


CREATE TABLE recipeIngredients (
	id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	measure_id INT(11),
	ingredient_id INT(11),
	recipe_id INT(11),
	amount VARCHAR(50),
	CONSTRAINT fk_measure FOREIGN KEY  (measure_id) REFERENCES measures(id),
	CONSTRAINT fk_ingredient FOREIGN KEY  (ingredient_id) REFERENCES ingredients(id),
	CONSTRAINT fk_recipe2 FOREIGN KEY  (recipe_id) REFERENCES recipes(id)
);


--INSERSIONCES

INSERT INTO measures (measure) VALUES('Cucharada'), ('Gramos'), ('Kilogramos'), ('Litro'), ('Pizca'), ('Taza');


INSERT INTO ingredients (name) VALUES('Agua');
INSERT INTO ingredients (name) VALUES('Aceite');
INSERT INTO ingredients (name) VALUES('Aceite de Coco');
INSERT INTO ingredients (name) VALUES('Aceite de Oliva');
INSERT INTO ingredients (name) VALUES('Aceite de Soja');
INSERT INTO ingredients (name) VALUES('Ají');
INSERT INTO ingredients (name) VALUES('Ají Picante');
INSERT INTO ingredients (name) VALUES('Ajonjolí');
INSERT INTO ingredients (name) VALUES('Aguacate');
INSERT INTO ingredients (name) VALUES('Albahaca');
INSERT INTO ingredients (name) VALUES('Almendras');
INSERT INTO ingredients (name) VALUES('Arequipe');
INSERT INTO ingredients (name) VALUES('Arroz');
INSERT INTO ingredients (name) VALUES('Arroz Integral');
INSERT INTO ingredients (name) VALUES('Avena');
INSERT INTO ingredients (name) VALUES('Azúcar');
INSERT INTO ingredients (name) VALUES('Bananas');
INSERT INTO ingredients (name) VALUES('Batatas');
INSERT INTO ingredients (name) VALUES('Berenjenas');
INSERT INTO ingredients (name) VALUES('Bicarbonato');
INSERT INTO ingredients (name) VALUES('Brocoli');
INSERT INTO ingredients (name) VALUES('Cacao');
INSERT INTO ingredients (name) VALUES('Café');
INSERT INTO ingredients (name) VALUES('Caldo de Pollo');
INSERT INTO ingredients (name) VALUES('Canela');
INSERT INTO ingredients (name) VALUES('Cambur Verde');
INSERT INTO ingredients (name) VALUES('Carne de Res');
INSERT INTO ingredients (name) VALUES('Carne de Soja');
INSERT INTO ingredients (name) VALUES('Calabaza');
INSERT INTO ingredients (name) VALUES('Calabacín');
INSERT INTO ingredients (name) VALUES('Camarones');
INSERT INTO ingredients (name) VALUES('Cebolla');
INSERT INTO ingredients (name) VALUES('Cebolla Morada');
INSERT INTO ingredients (name) VALUES('Champiñones');
INSERT INTO ingredients (name) VALUES('Chocolate');
INSERT INTO ingredients (name) VALUES('Chocolate Oscuro');
INSERT INTO ingredients (name) VALUES('Chocolate Blanco');
INSERT INTO ingredients (name) VALUES('Cilantro');
INSERT INTO ingredients (name) VALUES('Coco');
INSERT INTO ingredients (name) VALUES('Colifror');
INSERT INTO ingredients (name) VALUES('Diente de Ajo');
INSERT INTO ingredients (name) VALUES('Durazno');
INSERT INTO ingredients (name) VALUES('Espinaca');
INSERT INTO ingredients (name) VALUES('Fresas');
INSERT INTO ingredients (name) VALUES('Frijoles');
INSERT INTO ingredients (name) VALUES('Frijoles Negros');
INSERT INTO ingredients (name) VALUES('Frijoles Rojos');
INSERT INTO ingredients (name) VALUES('Frutos Secos');
INSERT INTO ingredients (name) VALUES('Garbanzos');
INSERT INTO ingredients (name) VALUES('Granola');
INSERT INTO ingredients (name) VALUES('Gelatina');
INSERT INTO ingredients (name) VALUES('Gelatina sin Sabor');
INSERT INTO ingredients (name) VALUES('Harina de Almendras');
INSERT INTO ingredients (name) VALUES('Harina de Avena');
INSERT INTO ingredients (name) VALUES('Harina de Maíz');
INSERT INTO ingredients (name) VALUES('Harina de Trigo');
INSERT INTO ingredients (name) VALUES('Harina de Trigo Integral');
INSERT INTO ingredients (name) VALUES('Huevos');
INSERT INTO ingredients (name) VALUES('Jamón');
INSERT INTO ingredients (name) VALUES('Jamón de Pavo');
INSERT INTO ingredients (name) VALUES('Leche');
INSERT INTO ingredients (name) VALUES('Leche de Avena');
INSERT INTO ingredients (name) VALUES('Leche de Almendra');
INSERT INTO ingredients (name) VALUES('Leche de Coco');
INSERT INTO ingredients (name) VALUES('Lechuga');
INSERT INTO ingredients (name) VALUES('Lentejas');
INSERT INTO ingredients (name) VALUES('Levadura');
INSERT INTO ingredients (name) VALUES('Limón');
INSERT INTO ingredients (name) VALUES('Linaza');
INSERT INTO ingredients (name) VALUES('Maíz');
INSERT INTO ingredients (name) VALUES('Maní');
INSERT INTO ingredients (name) VALUES('Mantequilla');
INSERT INTO ingredients (name) VALUES('Mantequilla de Maní');
INSERT INTO ingredients (name) VALUES('Manzanas');
INSERT INTO ingredients (name) VALUES('Mayonesa');
INSERT INTO ingredients (name) VALUES('Miel');
INSERT INTO ingredients (name) VALUES('Mostaza');
INSERT INTO ingredients (name) VALUES('Miel Mostaza');
INSERT INTO ingredients (name) VALUES('Nueces');
INSERT INTO ingredients (name) VALUES('Nuez Moscada');
INSERT INTO ingredients (name) VALUES('Oregano');
INSERT INTO ingredients (name) VALUES('Pan');
INSERT INTO ingredients (name) VALUES('Pan de Sandwich');
INSERT INTO ingredients (name) VALUES('Papaya');
INSERT INTO ingredients (name) VALUES('Parchita');
INSERT INTO ingredients (name) VALUES('Pasta');
INSERT INTO ingredients (name) VALUES('Pechuga de Pavo');
INSERT INTO ingredients (name) VALUES('Pechuga de Pollo');
INSERT INTO ingredients (name) VALUES('Pimienta');
INSERT INTO ingredients (name) VALUES('Pimentón');
INSERT INTO ingredients (name) VALUES('Platano Maduro');
INSERT INTO ingredients (name) VALUES('Platano Verde');
INSERT INTO ingredients (name) VALUES('Puerro');
INSERT INTO ingredients (name) VALUES('Queso');
INSERT INTO ingredients (name) VALUES('Queso Amarillo');
INSERT INTO ingredients (name) VALUES('Queso Mozarella');
INSERT INTO ingredients (name) VALUES('Queso Parmesano');
INSERT INTO ingredients (name) VALUES('Queso Pecorico');
INSERT INTO ingredients (name) VALUES('Repollo');
INSERT INTO ingredients (name) VALUES('Ricotta');
INSERT INTO ingredients (name) VALUES('Sal');
INSERT INTO ingredients (name) VALUES('Sal de Mar');
INSERT INTO ingredients (name) VALUES('Salsa de Soja');
INSERT INTO ingredients (name) VALUES('Salsa de Ajo');
INSERT INTO ingredients (name) VALUES('Tomates');
INSERT INTO ingredients (name) VALUES('Tocineta');
INSERT INTO ingredients (name) VALUES('Trucha');
INSERT INTO ingredients (name) VALUES('Uva');
INSERT INTO ingredients (name) VALUES('Vinagre de Manzana');
INSERT INTO ingredients (name) VALUES('Vino');
INSERT INTO ingredients (name) VALUES('Vino Blanco');
INSERT INTO ingredients (name) VALUES('Vino de Manzana');
INSERT INTO ingredients (name) VALUES('Vino de Mora');
INSERT INTO ingredients (name) VALUES('Yogourt');
INSERT INTO ingredients (name) VALUES('Yogourt de Soja');
INSERT INTO ingredients (name) VALUES('Yogurt Griego');
INSERT INTO ingredients (name) VALUES('Yuca');
INSERT INTO ingredients (name) VALUES('Zanahoria');


CREATE VIEW recipeComplete AS
SELECT r.title AS 'Recipe', r.description, r.created_at, r.steps, ri.amount AS 'Amount', mu.measure AS 'Measure', i.name AS 'Ingredient' 
FROM recipes r 
JOIN recipeIngredients ri on r.id = ri.recipe_id 
JOIN ingredients i on i.id = ri.ingredient_id 
LEFT OUTER JOIN measures mu on mu.id = measure_id;

CREATE VIEW recipeCompleteID AS
SELECT r.title AS 'Recipe', r.description, r.created_at, r.steps, r.id, ri.recipe_id, ri.amount AS 'Amount', mu.measure AS 'Measure', i.name AS 'Ingredient' 
FROM recipes r 
JOIN recipeIngredients ri on r.id = ri.recipe_id 
JOIN ingredients i on i.id = ri.ingredient_id 
LEFT OUTER JOIN measures mu on mu.id = measure_id;

SELECT * FROM recipes ORDER BY created_at DESC LIMIT 9;

SELECT * FROM recipes WHERE title LIKE "%   %" OR steps LIKE "%   %";































