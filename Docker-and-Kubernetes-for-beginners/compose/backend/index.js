const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;


const pool = new Pool({
    user: process.env.DB_USER || 'postgres',
    host: process.env.DB_HOST || 'localhost',
    database: process.env.DB_NAME || 'postgres',
    password: process.env.DB_PASSWORD || 'password',
    port: 5432,
});

app.get('/', async (req, res) => {
    res.send("Hello from Express Backend!");
});

app.get('/db', async (req, res) => {
    try {
        const result = await pool.query('SELECT NOW()');
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err);
        res.status(500).send('Database query failed');
    }
});
