import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrossNavigationBar extends StatefulWidget {
  const CrossNavigationBar({super.key, required this.changeHomePage});

  final void Function(int index) changeHomePage;

  @override
  State<CrossNavigationBar> createState() => _CrossNavigationBarState();
}

class _CrossNavigationBarState extends State<CrossNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(

      margin: EdgeInsets.symmetric(
        vertical: displayWidth * .05,
      ),
      height: displayWidth * .110,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: displayWidth * .2),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.changeHomePage(index);
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      listOfStrings[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.bold,
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

  List<String> listOfStrings = [
    '//24h',
    '//HOME',
    '//CONF',
  ];
}
