const express = require('express');
const mongoose = require('mongoose');
const Program = require('./models/Program'); // Assuming your model is in 'models/Program.js'

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/yourdb', { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log('MongoDB connected'))
    .catch(err => console.log('Error connecting to MongoDB:', err));

// Function to insert data into the database
async function insertPrograms() {
    try {
        const programs = [
            {
                "name": "Meditation Basics",
                "imageUrl": "https://static7.depositphotos.com/1039098/781/i/450/depositphotos_7813772-stock-photo-yoga-meditation-silhouette-pose.jpg",

                "tracks": [
                    {
                        "name": "Track 1: Intro to Meditation",
                        "audioUrl": "https://example.com/audio/track1.mp3"
                    },
                    {
                        "name": "Track 2: Guided Meditation",
                        "audioUrl": "https://example.com/audio/track2.mp3"
                    }
                ]
            },
            {
                "name": "Advanced Yoga",
                "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY1zxpXXLv-ZzIk9-ZeguVUJGowXWythVAdYftjE5lGwA6yeQnS7qh_IoaWdECywt6ttA&usqp=CAU",
                "tracks": [
                    {
                        "name": "Track 1: Yoga Warmup",
                        "audioUrl": "https://example.com/audio/track3.mp3"
                    },
                    {
                        "name": "Track 2: Advanced Poses",
                        "audioUrl": "https://example.com/audio/track4.mp3"
                    }
                ]
            }
        ];

        // Insert the programs into the database
        await Program.insertMany(programs);
        console.log('Programs inserted successfully!');
    } catch (err) {
        console.error('Error inserting programs:', err);
    }
}

// POST route to trigger the insertion
app.post('/insert-programs', async (req, res) => {
    try {
        await insertPrograms();
        res.status(200).send('Programs inserted');
    } catch (error) {
        res.status(500).send('Error inserting programs');
    }
});

// Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
