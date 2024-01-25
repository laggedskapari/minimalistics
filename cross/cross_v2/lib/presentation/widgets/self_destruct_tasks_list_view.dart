import 'package:cross_v2/domain/bloc/SelfDestructTask/self_destruct_task_bloc.dart';
import 'package:cross_v2/presentation/widgets/self_destruct_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelfDestructTasksListView extends StatelessWidget {
  const SelfDestructTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SelfDestructTaskBloc, SelfDestructTaskState>(
      builder: (context, state) {
        if (state is SelfDestructTaskLoadedState) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(displayWidth * .05),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.centerRight,
                          color: Theme.of(context).colorScheme.secondary.withOpacity(.6),
                          child: Icon(
                            Icons.delete_rounded,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                        child: SelfDestructTaskCard(
                          selfDestructTask: state.selfDestructTaskList[index],
                        ),
                      ),
                      itemCount: state.selfDestructTaskList.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Expanded(
          child: Center(
            child: Text(
              '//PHEW! NO RACE AGAINST TIME TODAY!',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        );
      },
    );
  }
}
