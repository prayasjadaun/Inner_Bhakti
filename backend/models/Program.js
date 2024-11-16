const mongoose = require('mongoose');

const TrackSchema = new mongoose.Schema({
    name: { type: String, required: true },
    audioUrl: { type: String, required: true },
});

const ProgramSchema = new mongoose.Schema({
    name: { type: String, required: true },
    imageUrl: { type: String, required: true },
    tracks: [TrackSchema],
});

module.exports = mongoose.model('Program', ProgramSchema);
