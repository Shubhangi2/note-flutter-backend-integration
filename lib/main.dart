import 'package:flutter/material.dart';
import 'package:note_app/presentation/note_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers:[
      
    ] , child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NoteScreen(),
    );
  }
}
