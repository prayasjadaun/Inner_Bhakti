import 'package:flutter/material.dart';
import '../models/program.dart';
import '../services/api_service.dart';
import 'program_details_screen.dart';

class ProgramListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  ProgramListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programs')),
      body: FutureBuilder<List<Program>>(
        future: apiService.fetchPrograms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final programs = snapshot.data!;
          return ListView.builder(
            itemCount: programs.length,
            itemBuilder: (context, index) {
              final program = programs[index];
              return ListTile(
                leading: Image.network(program.imageUrl),
                title: Text(program.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProgramDetailsScreen(programId: program.id),
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
