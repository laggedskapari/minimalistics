import 'package:cross_v2/data/database_services.dart';
import 'package:cross_v2/domain/bloc/TaskList/task_list_bloc.dart';
import 'package:cross_v2/presentation/widgets/Conf/cross_commands.dart';
import 'package:cross_v2/presentation/widgets/Conf/developer_info.dart';
import 'package:cross_v2/presentation/widgets/Conf/task_list_conf_card.dart';
import 'package:cross_v2/presentation/widgets/Conf/theme_preview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrossConf extends StatelessWidget {
  const CrossConf({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) =>
              TaskListBloc(RepositoryProvider.of<DatabaseServices>(context))
                ..add(LoadTaskListsEvent()),
          child: const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ThemePreviewCard(),
                TaskListsConfCard(),
                CrossCommands(),
                DeveloperInfo(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
