import 'package:flutter/material.dart';

class ConfirmDialogBox extends StatelessWidget {
  const ConfirmDialogBox({
    super.key,
    required this.dialogTitle,
    required this.onAffirmative,
    required this.onNegative,
  });

  final String dialogTitle;
  final void Function() onAffirmative;
  final void Function() onNegative;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: displayWidth * 0.02),
      child: Column(
        children: [
          Text(
            dialogTitle,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            children: [
              TextButton(
                onPressed: onAffirmative,
                child: const Text('//AFFIRMTIVE'),
              ),
              TextButton(
                onPressed: onNegative,
                child: const Text('//NEGATIVE'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
