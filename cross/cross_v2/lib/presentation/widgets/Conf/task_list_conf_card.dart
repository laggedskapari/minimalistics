import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/confirmation_dialog_box.dart';
import 'package:cross_v2/presentation/widgets/Conf/new_task_list_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListsConfCard extends StatelessWidget {
  const TaskListsConfCard({super.key});

  @override
  Widget build(BuildContext context) {
    void deleteTaskList({required String taskListId}) {
      BlocProvider.of<TaskListBloc>(context)
          .add(DeleteTaskListEvent(taskListId: taskListId));
      HapticFeedback.lightImpact();
      Navigator.pop(context, true);
    }

    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              '//CONFIGURE TASK LIST',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          BlocBuilder<TaskListBloc, TaskListState>(builder: (context, state) {
            if (state is TaskListsLoadedState) {
              return SizedBox(
                height: 150,
                child: Column(
                  children: [
                    Visibility(
                      visible: state.taskLists.isEmpty,
                      child: Text(
                        '[ADD SOME TASK LISTS HERE!]',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Visibility(
                      visible: state.taskLists.isNotEmpty,
                      child: Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.2),
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (val) async {
                                return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ConfirmDialogBox(
                                        dialogTitle:
                                            'DELETE [${state.taskLists[index].taskListTitle}]',
                                        onAffirmative: () {
                                          deleteTaskList(
                                              taskListId: state
                                                  .taskLists[index].taskListId);
                                        },
                                        onNegative: () {
                                          Navigator.pop(context, false);
                                        },
                                      ),
                                    ) ??
                                    false;
                              },
                              background: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(.6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  state.taskLists[index].taskListTitle,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            itemCount: state.taskLists.length,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: (state.taskLists.length < 3),
                      child: const NewTaskListForm(),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
        ],
      ),
    );
  }
}
