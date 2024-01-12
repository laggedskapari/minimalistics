import 'package:cross_v2/presentation/widgets/countdown_timer_card.dart';
import 'package:flutter/material.dart';

class SelfDestructTasks extends StatelessWidget {
  const SelfDestructTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CountdownTimerCard(),
      ],
    );
  }
}
