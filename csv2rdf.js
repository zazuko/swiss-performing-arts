const p = require('barnard59')
const path = require('path')
const fs = require('fs')
const _ = require('lodash')

const inputCount = p.count()
const outputCount = p.count()

const jobs = {
  Entwuerfe: path.join(__dirname, 'input/STS/Entwuerfe.csv-metadata.json')
}


_.forEach( jobs, function(value, key) {
  console.log(value)
  const config = JSON.parse(fs.readFileSync(value, 'utf8'))
})


