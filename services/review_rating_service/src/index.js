const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000
const db = require('C:/Users/anuja/OneDrive/Surrey/Semester 2/AWT/grp_cw_review_service/Showlite/services/Reviews/src/queries.js')

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
app.post('/addreview', db.insert_review)
app.post('/updatereview', db.update_review)
app.post('/deletereview', db.delete_review)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
  })
