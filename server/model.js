const db = require('../db');

const getQuestions = (questionDetails, callback) => {
  const q = `SELECT * FROM question
             WHERE product_id = '${questionDetails.product_id}' LIMIT ${questionDetails.count} `;

  db.query(q, callback)

}

const postQuestion = (questionDetails, callback) => {
  const q = `INSERT INTO question (product_id, body, date_written, asker_name, asker_email)
  VALUES (?, ?, ?, ?, ? )`

  let date = new Date().toISOString().slice(0, 19).replace('T', ' ');

  const { product_id, body, name, email } = questionDetails;

  db.query(q, [product_id, body, date, name, email], callback);
}

module.exports = {
  getQuestions,
  postQuestion
};