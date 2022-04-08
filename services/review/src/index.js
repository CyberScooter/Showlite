const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 5002
const db = require('./queries.js')

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)

app.get('/', (request, response) => {
    response.json({ info: 'Node.js, Express, and Postgres API' })
  })

app.get('/getreviews', db.get_review)
app.get('/countreview', db.count_review)
app.get('/checkreview', db.check_review)
app.post('/addreview', db.insert_review)
app.post('/deletereview', db.delete_review)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
  })
