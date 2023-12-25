import 'package:cross_flutter/widgets/countdown_timer_card.dart';
import 'package:cross_flutter/widgets/create_task_card.dart';
import 'package:flutter/material.dart';

import 'package:cross_flutter/widgets/task_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const CreateTaskCard(),
    );
  }
}
