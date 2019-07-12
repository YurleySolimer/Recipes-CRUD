const express = require('express');
const router = express.Router();

const pool = require('../database'); //conexión a la db
const { isLoggedIn } = require('../lib/auth');


router.get('/add', isLoggedIn, async (req, res) => {
	const measure = await pool.query('SELECT * FROM measures');
	const ingredient = await pool.query('SELECT * FROM ingredients');

	res.render('recipes/add.hbs', {measure, ingredient});

});


router.get('/steps/:id', isLoggedIn, async (req, res) => {
	const { id } = req.params;
	const recipes = await pool.query('SELECT * FROM recipes WHERE id =?', id); //Ruta a los links creados
    const recipeComplete = await pool.query('SELECT * FROM recipeCompleteID WHERE id=?', id);
    
	res.render('recipes/steps.hbs', {recipeComplete, recipes});

});


router.post('/add', isLoggedIn, async (req, res) => {

	const {title, description, steps} = req.body;
    const newRecipe = {
        title,
        description,
        steps,
        user_id: req.user.id
    };

    console.log(req.body);

    await pool.query('INSERT INTO recipes set ?', [newRecipe]); //agregar datos a la db
    const recipe_id = await pool.query('SELECT id FROM recipes WHERE title = ?', [newRecipe.title]);
    
    const { name } = req.body;
    let ingredient_id = [];

    const { measure } = req.body;
	let measure_id = [];

    const {amount} = req.body;
    const newAmount = {
    	amount
    };

   var recipeIng;

    for (var i = 0; i < name.length; i++) {
    	if (name[i] != "Elige") {
	    	ingredient_id[i] = await pool.query('SELECT id FROM ingredients WHERE name = ?', [name[i]]);
	    	measure_id[i] = await pool.query('SELECT id FROM measures WHERE measure = ?', [measure[i]]);
	    	
	        recipeIng = {   
	        	measure_id: measure_id[i][0].id,
	         	ingredient_id: ingredient_id[i][0].id,
	         	recipe_id: recipe_id[0].id,
	         	amount: newAmount.amount[i]
	        }
	             await pool.query('INSERT INTO recipeIngredients set ?', [recipeIng]);
   
        }
    }

    req.flash('success', 'Recipe Saved Successfully'); 
	res.redirect('/recipes'); //redirreciona a la ruta recipes
	//res.send('done');
});


router.get('/', isLoggedIn, async (req, res) => {
	const recipes = await pool.query('SELECT * FROM recipes WHERE user_id = ?', [req.user.id]); //Ruta a los links creados
    const recipeComplete = await pool.query('SELECT * FROM recipeCompleteID');
    console.log(recipeComplete);

	res.render('recipes/list.hbs', {recipes, recipeComplete}); 
});

router.get('/delete/:id', isLoggedIn, async (req, res) => {
	const { id } = req.params;

	await pool.query('DELETE FROM recipeIngredients WHERE recipe_id = ?', [id]);
	await pool.query('DELETE FROM recipes WHERE ID = ?', [id]); //Eliminar Recetas
	
	req.flash('success', 'Recipe Deleted Successfully');
	res.redirect('/recipes');
});

router.get('/edit/:id', isLoggedIn, async (req, res) => {
	const { id } = req.params;
	const recipes = await pool.query('SELECT * FROM recipes WHERE id = ?', [id]); //editar formulario
	res.render('recipes/edit.hbs', {recipe: recipes[0]});
});

router.post('/edit/:id', isLoggedIn, async (req, res) => {
	const { id } = req.params;
	const { title, description, url } = req.body;
	const newRecipe = {
		title,
		description,
		url
	};
	await pool.query('UPDATE recipes set ? WHERE id = ?', [newRecipe, id]); //Actualizar datos editados
	req.flash('success', 'Recipe Updated Successfully');
	res.redirect('/recipes');
});

module.exports = router;