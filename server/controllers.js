const Model = require('./model.js');

const getQuestions = (req, res) => {
  const questionDetails = req.query;


  Model.getQuestions(questionDetails, (err, questions) => {
    if (err) {
      res.status(400).send(err);
    } else {
      res.status(200).send(questions);
    }
  })
}

const postQuestion = (req, res) => {
  const questionDetails = req.body;


  Model.postQuestion(questionDetails, (err, data) => {
    if (err) {
      res.status(400).send(err);
    } else {
      res.status(200).send('success');
    }
  })
}



module.exports = {
  getQuestions,
  postQuestion
}
