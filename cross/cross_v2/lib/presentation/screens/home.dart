import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/SelfDestructTask/self_destruct_task_bloc.dart';
import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/screens/cross_conf.dart';
import 'package:cross_v2/presentation/screens/self_destruct_tasks.dart';
import 'package:cross_v2/presentation/widgets/cross_app_bar.dart';
import 'package:cross_v2/presentation/widgets/cross_navigation_bar.dart';
import 'package:cross_v2/presentation/widgets/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  void changeHomePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: <Widget>[
        BlocProvider(
          create: (context) => SelfDestructTaskBloc(
              RepositoryProvider.of<DatabaseServices>(context))
            ..add(LoadSelfDestructTasksEvent()),
          child: const SelfDestructTasks(),
        ),
        MultiBlocProvider(
          providers: [
            BlocProvider<TaskListBloc>(
              create: (context) =>
                  TaskListBloc(RepositoryProvider.of<DatabaseServices>(context))
                    ..add(LoadTaskListsEvent()),
            ),
            BlocProvider<TaskBloc>(
              create: (context) =>
                  TaskBloc(RepositoryProvider.of<DatabaseServices>(context)),
            ),
          ],
          child: const TasksPage(),
        ),
        const CrossConf(),
      ][pageIndex],
      bottomNavigationBar: CrossNavigationBar(
        changeHomePage: changeHomePage,
      ),
    );
  }
}
