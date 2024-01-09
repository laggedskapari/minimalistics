import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/presentation/screens/home.dart';
import 'package:cross_v2/theme/cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const CrossApp());

class CrossApp extends StatelessWidget {
  const CrossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DatabaseServices()),
      ],
      child: MaterialApp(
        theme: crossBlue,
        home: const Home(),
      ),
    );
  }
}
