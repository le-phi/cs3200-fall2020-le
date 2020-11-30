const quizzesDao = require('../daos/quizzes-dao.js')
module.exports = function (app) {
  app.get('/api/quizzes', (req, res) =>
      quizzesDao.findAllQuizzes()
      .then(allQuizzes => res.json(allQuizzes)))

  app.get('/api/quizzes/:qzid', (req, res) =>
      quizzesDao.findQuizById(req.params['qzid'])
      .then(quiz => res.json(quiz)))
}
