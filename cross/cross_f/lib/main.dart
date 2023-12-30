import 'package:cross_f/screens/home.dart';
import 'package:cross_f/services/task_services.dart';
import 'package:cross_f/test_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cross_f/utils/cross_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => TaskServices()),
      ],
      child: MaterialApp(
        home: const Home(),
        theme: crossTheme,
      ),
    );
  }
}
