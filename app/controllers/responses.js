'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Response = models.response
const setModel = require('./concerns/set-mongoose-model')

// find / show all responses
const index = (req, res, next) => {
  // find everything in the Response collection
  // Response.find()
  console.log('request.body is: ', req.body)
  console.log('req.body.survey_id is: ', req.body.survey_id)
// console.log('request is: ', req)
  Response.find({'survey_id': req.body.survey_id})
    .then(responses => {
      console.log('responses are: ', responses)
      res.json({ // res.json is like 'render' in rails
      // to each individual response:
        responses: responses.map((event) => // "responses" here could be called anything // map creates new array
        event.toJSON({ virtuals: true }))
      })
    })
    // just for error handling, move to the next thing?
    .catch(next)
}

// takes req(uest) and res(ponse) objects
const show = (req, res) => {
  // sends a json response of the requested response
  res.json({
    response: req.response.toJSON({ virtuals: true })
  })
}

const create = (req, res, next) => {
  // adds the _owner key to req.body.response and sets the req.user_id // this creates an response with an _owner
  const response = Object.assign(req.body.response)
  // executes the create method on Response model with response object
    // this response object is created with data from the client and the current user as _owner
  Response.create(response)
    // the newly created response we get from database is rendered as JSON
    .then(response =>
      res.status(201)
        .json({
          response: response.toJSON({ virtuals: true })
        }))
    // if there is an error, send to the error handler
    .catch(next)
}

const update = (req, res, next) => {
  // protects against malicious users by deleting the _owner key from req.body
  console.log(req.body._owner)
  delete req.body._owner  // disallow owner reassignment.
  // updates the response in the database
  req.response.update(req.body.response)
    // if update is successful then send 204 status back to client
    // is 204 the right status for an update?
    .then(() => res.sendStatus(204))
    // if update fails, send error handler message
    .catch(next)
}

const destroy = (req, res, next) => {
  // remove response from db
  req.response.remove()
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
  // runs the setModel middleware for show controller action
  { method: setModel(Response), only: ['show'] },
  // runs the setModel middleware for update and destroy controller actions, making sure the user only does it on things associated with that user
  { method: setModel(Response, { forUser: true }), only: ['update', 'destroy'] }
]
})
