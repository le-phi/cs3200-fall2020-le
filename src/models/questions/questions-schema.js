const mongoose = require('mongoose')

const questionsSchema = mongoose.Schema({
  question: String,
  options: [String],
  quizId: String
}, {collection: 'questions'})
module.exports = questionsSchema