const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const dbPassword = process.env.DB_PASSWORD || 'not set';

app.get('/', (req, res) => {
  res.send(`SecureBank App Running. DB Password: ${dbPassword}`);
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

