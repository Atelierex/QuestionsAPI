const express = require('express');
const app = express();

const controller = require('./controllers.js');
var db = require('../db');
const port = 3000

app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.use(express.static('public'))
// app.get('/hello', ((req,res) => res.send('hello')))

app.get('/qa/questions', controller.getQuestions);
app.post('/qa/questions', controller.postQuestion);


app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
