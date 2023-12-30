import 'package:cross_f/widgets/countdown_timer_card.dart';
import 'package:cross_f/widgets/create_task_card.dart';
import 'package:cross_f/widgets/tasks_list_view.dart';
import 'package:cross_f/widgets/title_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const CrossAppBar(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CountdownTimerCard(),
          Expanded(child: TaskListView()),
          CreateTaskCard(),
        ],
      ),
    );
  }
}