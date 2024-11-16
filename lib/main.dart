import 'package:flutter/material.dart';
import 'package:inner_bhakti/frontend/screens/program_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Inner Bhakti',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ProgramListScreen(),
    );
  }
}
