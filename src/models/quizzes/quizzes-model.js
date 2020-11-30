const mongoose = require('mongoose')
const quizSchema = require('./quizzes-schema.js')
const quizModel = mongoose.model('QuizModel', quizSchema)
module.exports = quizModel