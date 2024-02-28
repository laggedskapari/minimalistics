import 'package:flutter/material.dart';

class LogsNavigationBar extends StatefulWidget {
  const LogsNavigationBar({super.key});

  @override
  State<LogsNavigationBar> createState() => _LogsNavigationBarState();
}

class _LogsNavigationBarState extends State<LogsNavigationBar> {
  List<String> pageName = ['pub', 'home', 'conf'];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: displayWidth,
      ),
      height: 20,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Container(
        alignment: Alignment.center,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '[${pageName[index]}]',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'JetBrainsMono',
                        fontWeight: index == currentIndex
                            ? FontWeight.w900
                            : FontWeight.normal,
                        color: index == currentIndex
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
