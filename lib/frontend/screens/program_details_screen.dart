import 'package:flutter/material.dart';
import '../models/track.dart';
import '../services/api_service.dart';
import 'audio_player_screen.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final String programId;
  final ApiService apiService = ApiService();

  ProgramDetailsScreen({super.key, required this.programId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program Details')),
      body: FutureBuilder<List<Track>>(
        future: apiService.fetchProgramDetails(programId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final tracks = snapshot.data!;
          return ListView.builder(
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              return ListTile(
                title: Text(track.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AudioPlayerScreen(audioUrl: track.audioUrl),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
