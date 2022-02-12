import 'package:flutter/material.dart';
import 'package:my_notes/screens.dart/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyNotesScreen(),
        '/AddNote': (context) => const AddNote(),
        '/NoteDetails': (context) => const NoteDetails(),
      },
    );
  }
}
