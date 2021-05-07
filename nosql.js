// Questions and Answer

{
  "product_id": Number,
  "questions": [{
      "question_id": String,
      "question_body": String,
      "question_date": Date,
      "asker_name": String,
      "question_helpfulness": Number,
      "reported": Boolean,
      "answers": {
        // Uses An Object because of O(1) and 68 is a Key
        68: {
          "id": Number,
          "body": String,
          "date": Date,
          "answerer_name": String,
          "helpfulness": Number,
          "reported": Boolean,
          "photos": [{
            "id": Number,
            "url": String
          }]
          // ...
        }
      }
  }],
}