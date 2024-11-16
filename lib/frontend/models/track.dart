class Track {
  final String id;
  final String name;
  final String audioUrl;

  Track({required this.id, required this.name, required this.audioUrl});

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['_id'],
      name: json['name'],
      audioUrl: json['audioUrl'],
    );
  }
}
