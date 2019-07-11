const express = require('express');
const router = express.Router();

const pool = require('../database');

const passport = require('passport');
const { isLoggedIn, isNotLoggedIn } = require('../lib/auth');

router.get('/signup', isNotLoggedIn, (req, res) => {  //ruta de SignUp
  res.render('auth/signup');
});

router.post('/signup', isNotLoggedIn, passport.authenticate('local.signup', {
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
}));

router.get('/signin', isNotLoggedIn, (req, res) => {  //ruta de SignIn
  res.render('auth/signin');
});

router.post('/signin', isNotLoggedIn, (req, res, next) => {
	passport.authenticate('local.signin', {
		successRedirect: '/profile',
		failureRedirect: '/signin',
		failureFlash: true
	})(req, res, next);
});

router.get('/profile', isLoggedIn, async (req,res) => {
	const lastRecipes = await pool.query('SELECT * FROM recipes ORDER BY created_at DESC LIMIT 9');
	res.render('profile', {lastRecipes}); 
});

router.get('/logout', isLoggedIn, (req,res) => {
	req.logOut();
	res.redirect('/signin');
});

module.exports = router;