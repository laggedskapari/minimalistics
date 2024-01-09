import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/countdown_timer_card.dart';
import 'package:cross_v2/presentation/widgets/cross_app_bar.dart';
import 'package:cross_v2/presentation/widgets/cross_navigation_bar.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/synopsis_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_card.dart';
import 'package:cross_v2/presentation/widgets/task_list_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskListBloc(RepositoryProvider.of<DatabaseServices>(context))..add(LoadTaskListsEvent()),
      child: Scaffold(
        appBar: const CrossAppBar(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Center(
          child: TaskListPageBuilder(),
        ),
        bottomNavigationBar: const CrossNavigationBar(),
      ),
    );
  }
}
