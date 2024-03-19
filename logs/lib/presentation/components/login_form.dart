import 'package:flutter/material.dart';
import 'package:logs/presentation/components/form_text_field.dart';
import 'package:logs/presentation/components/password_strength_meter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obsecurePassword = true;
  bool _isPasswordStrong = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      height: deviceHeight * .9,
      alignment: Alignment.center,
      child: Form(
        key: _loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: deviceWidth * 0.8,
              child: FormTextField(
                textController: _emailController,
                hintText: 'email...',
                obsecureText: false,
                keyboardType: TextInputType.emailAddress,
                errorMessage: _errorMessage,
                validator: (value) {
                  if (value!.isEmpty) {
                    return '//No email address found.';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return '//Invalid email address.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              child: Column(
                children: [
                  FormTextField(
                    textController: _passwordController,
                    hintText: 'passkey...',
                    obsecureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              child: TextButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty){
                    print(_errorMessage);
                  }
                },
                child: Text(
                  '[PROCEED]',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'JetBrainsMono',
                    color: true
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
