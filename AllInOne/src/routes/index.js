const express = require('express');
const router = express.Router();

const pool = require('../database'); 
const { isLoggedIn } = require('../lib/auth');


router.get('/', isLoggedIn, async (req, res) => {
	const allRecipes = await pool.query('SELECT * FROM recipes');
	const recipeCate = await pool.query('SELECT * FROM recipeCate');
	const lastRe = await pool.query('SELECT * FROM recipeCate ORDER BY created_at DESC LIMIT 8')

	res.render('index', {allRecipes, lastRe, recipeCate});
});



module.exports = router;