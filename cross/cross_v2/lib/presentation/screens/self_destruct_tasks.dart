import 'package:cross_v2/presentation/widgets/countdown_timer_card.dart';
import 'package:cross_v2/presentation/widgets/new_self_destruct_task_form.dart';
import 'package:cross_v2/presentation/widgets/self_destruct_tasks_list_view.dart';
import 'package:flutter/material.dart';

class SelfDestructTasks extends StatelessWidget {
  const SelfDestructTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountdownTimerCard(),
        SelfDestructTasksListView(),
        NewSelfDestructTaskForm(),
      ],
    );
  }
}
