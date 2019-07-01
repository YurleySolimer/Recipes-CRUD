const express = require('express');
const router = express.Router();

const pool = require('../database'); //conexión a la db
const { isLoggedIn } = require('../lib/auth');

router.get('/add', isLoggedIn, (req, res) => {
	res.render('recipes/add.hbs');
});

router.post('/add', isLoggedIn, async (req, res) => {
    const { title, url, description } = req.body;
    const newRecipe = {
        title,
        description,
        user_id: req.user.id
    };
    await pool.query('INSERT INTO recipes set ?', [newRecipe]); //agregar datos a la db
	res.redirect('/recipes'); //redirreciona a la ruta recipes
});

router.get('/', isLoggedIn, async (req, res) => {
	const recipes = await pool.query('SELECT * FROM recipes WHERE user_id = ?', [req.user.id]);    //ruta a los links creados
    req.flash('success', 'Recipe Saved Successfully'); 
	res.render('recipes/list.hbs', {recipes}); //pasar los datos a list
});

router.get('/delete/:id', isLoggedIn, async (req, res) => {
	const { id } = req.params;
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