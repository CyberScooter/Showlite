const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000
const db = require('./queries')

app.use(bodyParser.json())
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
)


app.get('/', (request, response) => {
    response.json({ info: 'Node.js, Express, and Postgres API' })
  })

app.post('/getreviews', db.get_review)
app.post('/addreview', db.insert_review)
app.post('/updatereview', db.update_review)
app.put('/deletereview', db.delete_review)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
  })
