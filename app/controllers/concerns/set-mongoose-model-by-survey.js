'use strict'

const HttpError = require('lib/wiring/errors/http-error')

const setMongooseModelBySurvey = (model, options) =>
  function (req, res, next) {
    const search = { survey_id: req.params.id }
    if (options && options.forUser) {
      search._owner = req.user
    }

    model.findOne(search, (error, document) => {
      error = error || !document && new HttpError(404)
      if (error) {
        return next(error)
      }

      req[model.modelName.toLowerCase()] = document
      next()
    })
  }

module.exports = setMongooseModelBySurvey
