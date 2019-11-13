// const http = require('http');
// const server = http.createServer((req,res)=>{
// 	res.writeHead(200,{'Content-Type' : 'text/plain'});
// 	res.end('Hello World\n');
// });
// server.listen(80);
// console.log('서버 실행 중 ...at ');

var express = require('express');//웹 서버 사용.
var app = express();
var fs = require('fs');//파일 로드 사용.
app.use(express.static('template')); // template 폴더 아래 파일들을 바로 접근 가능
//포트 설정
app.listen(80, function(){
 console.log('Server Start');
});

//라우팅 설정
app.get('/', function(req,res){//웹 서버 기본주소로 접속 할 경우 실행.
 fs.readFile('./template/index.html', function(error, data){//test.html 파일 로드.
  if(error){
   console.log(error);
  }else{
   res.writeHead(200,{'Content-Type':'text/html'});//Head Type설정.
   res.end(data);//파일 로드 html response.
  }
 }); 
});