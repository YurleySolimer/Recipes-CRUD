module.exports = {
    isLoggedIn (req, res, next) {  //Método para saber si el usuario está logueado o no
        if (req.isAuthenticated()) {  //true si la sesión del usuario existe
            return next();
        }
        return res.redirect('/signin');
    },

    isNotLoggedIn (req, res, next) {  //Método para que el usuario no vuelva a loguearse
        if (!req.isAuthenticated()) {  
            return next();
        }
        return res.redirect('/profile');
    }
};