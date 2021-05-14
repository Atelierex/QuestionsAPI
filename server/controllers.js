const Model = require('./model.js');

const getQuestions = (req, res) => {
  const questionDetails = req.query;
  // console.log(questionDetails);

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
  console.log(questionDetails);
  //body	text	Text of question being asked
  // name	text	Username for question asker
  // email	text	Email address for question asker
  // product_id	integer	Required ID of the Product for which the question is posted

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
