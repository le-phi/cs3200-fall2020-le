const questionsDao = require('../daos/questions-dao.js')
module.exports = function(app) {

  app.get('/api/quizzes/:qid/questions', (req, res) =>
      questionsDao.findQuestionsForQuiz(req.params['qid'])
      .then(questions => res.json(questions)))

  app.get('/api/questions', (req, res) =>
      questionsDao.findAllQuestions()
      .then(allQuestions => res.json(allQuestions)))

  app.get('/api/questions/:qid', (req, res) =>
      questionsDao.findQuestionById(req.params['qid'])
      .then(question => res.json(question)))
}
