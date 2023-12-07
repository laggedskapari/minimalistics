import 'package:flutter/material.dart';
import 'package:cross_flutter/presentation/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ super.key });

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 52, 55),
      body: LoginForm(),
    );
  }
}