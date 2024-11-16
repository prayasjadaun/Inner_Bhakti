import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerScreen({super.key, required this.audioUrl});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<PlayerState>(
              stream: _audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state == null) {
                  return const CircularProgressIndicator();
                }

                if (state.playing) {
                  return ElevatedButton(
                    onPressed: _audioPlayer.pause,
                    child: const Text('Pause'),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: _audioPlayer.play,
                    child: const Text('Play'),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder<Duration?>(
              stream: _audioPlayer.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                return Text('Position: ${position.inSeconds}s');
              },
            ),
          ],
        ),
      ),
    );
  }
}
