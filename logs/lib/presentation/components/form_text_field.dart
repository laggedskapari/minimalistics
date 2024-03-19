import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController textController;
  final bool obsecureText;
  final TextInputType keyboardType;
  final String hintText;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMessage;
  final String? Function(String?)? onChanged;

  const FormTextField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.obsecureText,
    required this.keyboardType,
    this.onTap,
    this.validator,
    this.errorMessage,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        errorText: errorMessage,
      ),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
