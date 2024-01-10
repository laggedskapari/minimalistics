import 'package:cross_v2/data/task_list.dart';
import 'package:cross_v2/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key, required this.taskList});

  final TaskList taskList;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: displayWidth * .10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
            child: Text(
              taskList.taskListTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '//TOTAL: 10',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '//COMPLETED: ${taskList.completedTasks}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
          const TaskCard(),
        ],
      ),
    );
  }
}
