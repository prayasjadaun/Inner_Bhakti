class Program {
  final String id;
  final String name;
  final String imageUrl;

  Program({required this.id, required this.name, required this.imageUrl});

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
