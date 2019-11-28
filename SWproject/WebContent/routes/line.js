var express = require('express');
var router = express.Router();
var mysql_obdc = require('../db/db_conn')();
var conn = mysql_obdc.init();
 
router.get('/line', function(req, res, next) {
 	var sql = 'select * from attraction';
    conn.query(sql,function(err,result,fileds){
	 	if(err){
	 		console.log(err);
	 		res.status(500).send('Internal Server Error');
	 	}
		else{
			res.render('line',{
				results : result
			});
		}
	 })
});
module.exports = router;