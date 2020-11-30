const mongoose = require('mongoose')
const questionSchema = require('./questions-schema.js')
const questionModel = mongoose.model('QuestionModel', questionSchema)
module.exports = questionModel