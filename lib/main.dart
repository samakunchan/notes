import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/architectures/presentations/notes_presentation.dart';
import 'package:notes/core/services/notes_service.dart';

void setUpLocator(){
  GetIt.I.registerLazySingleton(() => NoteService());
}

void main() async {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesPresentation()
    );
  }
}
