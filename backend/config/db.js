const mongoose = require('mongoose');

const connectDB = async () => {
    try {
        // Connect to MongoDB with the correct URI
        await mongoose.connect('mongodb://localhost:27017/yourdb', {
            useNewUrlParser: true,
            useUnifiedTopology: true  // MongoDB connection options
        });
        console.log('MongoDB connected');
    } catch (err) {
        console.error('Error connecting to MongoDB:', err.message);
        process.exit(1);  // Exit process with failure
    }
};

module.exports = connectDB;
