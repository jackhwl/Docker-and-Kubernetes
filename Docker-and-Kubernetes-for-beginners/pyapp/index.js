const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World from a dockerized app!');
});
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
// Export the app for testing purposes