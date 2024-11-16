const Program = require('../models/Program');

// Fetch all programs
exports.getPrograms = async (req, res) => {
    try {
        const programs = await Program.find();
        res.json(programs);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

// Fetch details of a specific program
exports.getProgramDetails = async (req, res) => {
    try {
        const program = await Program.findById(req.params.id);
        if (!program) {
            return res.status(404).json({ error: 'Program not found' });
        }
        res.json(program.tracks);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};
