const express = require("express")
const app = express()

const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/whiteboard',
    {useNewUrlParser: true});

require("./http/quizzes-http-api.js")(app)
require("./http/questions-http-api.js")(app)

app.listen(3000)