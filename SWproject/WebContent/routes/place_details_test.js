var express = require('express');
var router = express.Router();
var mysql_obdc = require('../db/db_conn')();
var conn = mysql_obdc.init();
 
router.get('/place_details_test', function(req,res,next){
	conn.connect(function(err) {
        if (err) {
            console.error(err);
            throw err;
        }else{
           res.render('place_details_test', {title: "후기를 쓰자"});
        }
    });
});

router.post('/place_details_test', function(req, res, next){
	var user_id = 'aaa';
	var content = req.body.text;
	var content_name = '서울 밤도깨비 야시장';
	var datas = [content_name, user_id, content];
	conn.connect(function(err) {
        if (err) {
            console.error(err);
            throw err;
        }else{
           var sql = "insert into test(content_name, user_id, content) values(?,?,?)";
	conn.query(sql, datas, function (err, rows){
		if (err) console.error("err: " +err);
		res.redirect('/place_details_test');
	});
        }
    });
	
});
module.exports = router;

