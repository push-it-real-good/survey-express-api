'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Question = models.question

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

// find / show all questions
const index = (req, res, next) => {
  // find everything in the Question collection
  Question.find()
    .then(questions => res.json({ // res.json is like 'render' in rails
      // to each individual question:
      questions: questions.map((event) => // "questions" here could be called anything // map creates new array
        event.toJSON({ virtuals: true, user: req.user }))
    }))
    // just for error handling, move to the next thing?
    .catch(next)
}

// takes req(uest) and res(ponse) objects
const show = (req, res) => {
  // sends a json response of the requested question
  res.json({
    question: req.question.toJSON({ virtuals: true, user: req.user })
  })
}

const create = (req, res, next) => {
  // adds the _owner key to req.body.question and sets the req.user_id // this creates an question with an _owner
  const question = Object.assign(req.body.question, {
    _owner: req.user._id
  })
  // executes the create method on Question model with question object
    // this question object is created with data from the client and the current user as _owner
  Question.create(question)
    // the newly created question we get from database is rendered as JSON
    .then(question =>
      res.status(201)
        .json({
          question: question.toJSON({ virtuals: true, user: req.user })
        }))
    // if there is an error, send to the error handler
    .catch(next)
}

const update = (req, res, next) => {
  // protects against malicious users by deleting the _owner key from req.body
  console.log(req.body._owner)
  delete req.body._owner  // disallow owner reassignment.
  // updates the question in the database
  req.question.update(req.body.question)
    // if update is successful then send 204 status back to client
    // is 204 the right status for an update?
    .then(() => res.sendStatus(204))
    // if update fails, send error handler message
    .catch(next)
}

const destroy = (req, res, next) => {
  // remove question from db
  req.question.remove()
  // if successfully remove ex from db, return 204 to client
    .then(() => res.sendStatus(204))
    // error handling
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  // runs the setUser middleware for index and show controller actions
  { method: setUser, only: ['index', 'show'] },
  // runs the authenticate middleware for all controller actions except index and show
  { method: authenticate, except: ['index', 'show'] },
  // runs the setModel middleware for show controller action
  { method: setModel(Question), only: ['show'] },
  // runs the setModel middleware for update and destroy controller actions, making sure the user only does it on things associated with that user
  { method: setModel(Question, { forUser: true }), only: ['update', 'destroy'] }
]
})
