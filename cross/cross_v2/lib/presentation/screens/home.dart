import 'package:cross_v2/presentation/widgets/countdown_timer_card.dart';
import 'package:cross_v2/presentation/widgets/cross_app_bar.dart';
import 'package:cross_v2/presentation/widgets/cross_navigation_bar.dart';
import 'package:cross_v2/presentation/widgets/new_task_form.dart';
import 'package:cross_v2/presentation/widgets/synopsis_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(
        child: CrossNavigationBar(),
      ),
      bottomNavigationBar: const CrossNavigationBar(),
    );
  }
}
