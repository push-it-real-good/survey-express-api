'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Survey = models.survey
const Response = models.response
// const responses = require('./responses')

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

// find / show all surveys
const index = (req, res, next) => {
  // find everything in the Survey collection
  Survey.find({'_owner': req.user})
    .then(surveys => {
      console.log('survey index req.user is: ', req.user)
      res.json({ // res.json is like 'render' in rails
      // to each individual survey:
        surveys: surveys.map((event) => // "surveys" here could be called anything // map creates new array
          event.toJSON({ virtuals: true, user: req.user }))
      })
    })
    // just for error handling, move to the next thing?
    .catch(next)
}

// takes req(uest) and res(ponse) objects
const show = (req, res) => {
  // sends a json response of the requested survey
  res.json({
    // survey: req.survey.toJSON({ virtuals: true, user: req.user })
    survey: req.survey.toJSON({ virtuals: true })
  })
}

const create = (req, res, next) => {
  // adds the _owner key to req.body.survey and sets the req.user_id // this creates an survey with an _owner
  const survey = Object.assign(req.body.survey, {
    _owner: req.user._id
  })
  // executes the create method on Survey model with survey object
    // this survey object is created with data from the client and the current user as _owner
  Survey.create(survey)
    // the newly created survey we get from database is rendered as JSON

    .then(survey =>
      res.status(201)
        .json({
          survey: survey.toJSON({ virtuals: true, user: req.user })
        })
      )

    // if there is an error, send to the error handler
    .catch(next)
}

const update = (req, res, next) => {
  // protects against malicious users by deleting the _owner key from req.body
  console.log('update survey here: ', req.body)
  console.log('update survey here: ', req.body.survey)
  console.log('here is the req.survey._owner: ', req.survey._owner)
  // console.log('update survey here for req: ', req)
  // console.log('update survey here for res: ', res)
  // delete req.body._owner  // disallow owner reassignment.
  delete req.survey._owner  // disallow owner reassignment.
// updates the survey in the database
  req.survey.update(req.body.survey)
    // if update is successful then send 204 status back to client
    // is 204 the right status for an update?
    .then(() => res.sendStatus(204))
    // if update fails, send error handler message
    .catch(next)
}

const destroy = (req, res, next) => {
  // remove survey from db
  req.survey.remove()
  // if successfully remove ex from db, return 204 to client
    .then(() => {
      // console.log('URL_PATH is this: ', req.URL_PATH)
      // console.log('req.survey is: ', req.survey)
      // console.log('req.survey._id is: ', req.survey._id)

      // responses.controller.destroy(req.survey._id)
      // Response.find({'survey_id': req.survey._id}).remove()
      Response.remove({survey_id: req.survey._id}).exec()
      res.sendStatus(204)
      // console.log('req body is: ', req.body)
      // console.log('request is: ', req.survey)
    })
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
  { method: setModel(Survey), only: ['show'] },
  // runs the setModel middleware for update and destroy controller actions, making sure the user only does it on things associated with that user
  { method: setModel(Survey, { forUser: true }), only: ['update', 'destroy'] }
]
})
