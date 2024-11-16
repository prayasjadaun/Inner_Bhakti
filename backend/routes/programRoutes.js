const express = require('express');
const { getPrograms, getProgramDetails } = require('../controllers/programController');
const router = express.Router();

// Route to get the list of programs
router.get('/', getPrograms);

// Route to get details of a specific program
router.get('/:id', getProgramDetails);

module.exports = router;
