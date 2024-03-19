import 'package:flutter/material.dart';

class PasswordStrengthMeter extends StatefulWidget {
  const PasswordStrengthMeter({
    super.key,
    required this.password,
    required this.onStrengthChange,
  });

  final String password;

  final Function(bool isStrong) onStrengthChange;

  @override
  State<PasswordStrengthMeter> createState() => _PasswordStrengthMeter();
}

class _PasswordStrengthMeter extends State<PasswordStrengthMeter> {
  @override
  void didUpdateWidget(covariant PasswordStrengthMeter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.password != oldWidget.password) {
      final isStrong = _validators.entries.every(
        (entry) => entry.key.hasMatch(widget.password),
      );

      WidgetsBinding.instance.addPostFrameCallback(
        (_) => widget.onStrengthChange(isStrong),
      );
    }
  }

  final Map<RegExp, String> _validators = {
    RegExp(r'[A-Z]'): '//One uppercase letter',
    RegExp(r'[!@#\$%^&*(),.?":{}|<>]'): '//One special character',
    RegExp(r'\d'): '//One number',
    RegExp(r'^.{8,32}$'): '//8-32 characters',
  };

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.password.isNotEmpty;

    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _validators.entries.map(
          (entry) {
            final hasMatch = entry.key.hasMatch(widget.password);
            final color = hasValue ? (hasMatch ? Colors.green : Colors.red) : null;
            final weight = hasValue ? (hasMatch ? FontWeight.w900 : FontWeight.normal) : null;
            return Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                entry.value.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontWeight: weight,
                  fontSize: 14
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
