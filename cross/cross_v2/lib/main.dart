import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/Theme/theme_bloc.dart';
import 'package:cross_v2/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const CrossApp()));
}

class CrossApp extends StatelessWidget {
  const CrossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DatabaseServices()),
      ],
      child: BlocProvider(
        create: (context) =>
            ThemeBloc(RepositoryProvider.of<DatabaseServices>(context))
              ..add(SetDefaultThemeEvent()),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            if (state is ThemeSetState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: state.themeData,
                home: const Home(),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
