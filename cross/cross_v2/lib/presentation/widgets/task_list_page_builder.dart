import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/new_task_list_form.dart';
import 'package:cross_v2/presentation/widgets/task_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TaskListPageBuilder extends StatefulWidget {
  const TaskListPageBuilder({super.key});

  @override
  State<TaskListPageBuilder> createState() => _TaskListPageBuilderState();
}

class _TaskListPageBuilderState extends State<TaskListPageBuilder> {
  int activePage = 0;
  int taskListId = 0;
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
      if (state is TaskListsLoadedState) {
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: state.taskLists.length,
                onPageChanged: (int page) {
                  setState(() {
                    activePage = page;
                    HapticFeedback.mediumImpact();
                    taskListId = state.taskLists[page].id;
                    print(taskListId);
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return TaskListPage(
                    taskList: state.taskLists[index],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: state.taskLists.length,
              effect: ExpandingDotsEffect(
                dotColor: Theme.of(context).colorScheme.secondary,
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
            NewTaskForm(
              taskList: taskListId,
            ),
          ],
        );
      }
      return const CircularProgressIndicator();
    });
  }
}
