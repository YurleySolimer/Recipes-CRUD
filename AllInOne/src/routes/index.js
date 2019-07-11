const express = require('express');
const router = express.Router();

const pool = require('../database'); 

router.get('/', async (req, res) => {
	const allRecipes = await pool.query('SELECT * FROM recipes');
	const lastRe = await pool.query('SELECT * FROM recipes ORDER BY created_at DESC LIMIT 15')
	res.render('index', {allRecipes, lastRe});
});



module.exports = router;