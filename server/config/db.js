
throw new Error("TEST DB FILE LOADED");
const mysql = require('mysql');

console.log("Using updated DB config");

const db = mysql.createConnection({
  host: '127.0.0.1',
  user: 'appuser',
  password: 'ankrish004',
  database: 'test_db',
});

db.connect((err) => {
  if (err) {
    console.error('Database connection failed:', err);
    return;
  }

  console.log('Connected to database successfully!');
});

module.exports = db;