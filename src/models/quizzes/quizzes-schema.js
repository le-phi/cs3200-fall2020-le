const mongoose = require('mongoose')

const quizzesSchema = mongoose.Schema({
  title: String,
  quizId: String
}, {collection: 'quizzes'})
module.exports = quizzesSchema