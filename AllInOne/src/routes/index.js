const express = require('express');
const router = express.Router();

const pool = require('../database'); 
const { isLoggedIn } = require('../lib/auth');


router.get('/', isLoggedIn, async (req, res) => {
	const allRecipes = await pool.query('SELECT * FROM recipes');
	const lastRe = await pool.query('SELECT * FROM recipes ORDER BY created_at DESC LIMIT 8')
	res.render('index', {allRecipes, lastRe});
});



module.exports = router;