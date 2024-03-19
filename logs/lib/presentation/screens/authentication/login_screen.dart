import 'package:flutter/material.dart';
import 'package:logs/presentation/components/login_form.dart';
import 'package:logs/presentation/logs_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LogsAppBar(),
      body: LoginForm(),
    );
  }
}
