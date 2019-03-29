const express = require('express');
const app = express();
const bodyParser=require('body-parser');
const mysql = require('mysql');
const dbcon = mysql.createConnection({
        'host':'localhost',
        'port':3306,
        'user':'root',
        'database':'atmospheredb'
});

app.use(express.json());

app.use(express.static('public'));
dbcon.connect(function(err,res){
        if(err){console.log("err",err);
        }else{
        console.log("success");
        }
});

app.get('/api/getdata', function(req,res){
        getData(req, res);
});

app.post('/api/putdata', function(req,res){
console.log(req);
        console.log(req.temperature);
        putData(req.body, res);
});


function getData(req,res){
        dbcon.query('select * from atmospheretable order by created_time desc limit 1;',function(error,result){

                if(error) {
                        res.send(error);
                }else {
                        res.send(result.length?result[0]:result);
                }

        });
}

function putData(req,res){
        dbcon.query('insert into atmospheretable (temperature,humidity,created_time) values (?,?,now()) ;',[req.temperature,req.humidity],function(error,result){

                if(error) {
                        res.send(error);
                }else {
                        res.send(result.length?result[0]:result);
                }

        });

}

app.listen(3001, () => console.log('Server running on port 3001'))
