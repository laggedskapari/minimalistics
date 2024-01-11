import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/Task/task_bloc.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/screens/cross_conf.dart';
import 'package:cross_v2/presentation/widgets/countdown_timer_card.dart';
import 'package:cross_v2/presentation/widgets/cross_app_bar.dart';
import 'package:cross_v2/presentation/widgets/cross_navigation_bar.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/synopsis_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_list_view.dart';
import 'package:cross_v2/presentation/widgets/task_list_page_builder.dart';
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
        const CrossConf(),
        MultiBlocProvider(
          providers: [
            BlocProvider<TaskListBloc>(
              create: (context) => TaskListBloc(RepositoryProvider.of<DatabaseServices>(context))..add(LoadTaskListsEvent()),
            ),
            BlocProvider<TaskBloc>(
              create: (context) =>TaskBloc(RepositoryProvider.of<DatabaseServices>(context)),
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
