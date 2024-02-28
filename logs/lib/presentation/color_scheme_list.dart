import 'package:flutter/material.dart';
import 'package:logs/theme/log_color_scheme.dart';

class ColorSchemeList extends StatelessWidget {
  ColorSchemeList({super.key});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: displayWidth * .10),
      child: ListView.builder(
        itemBuilder: (context, index) => InkWell(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
  List<ThemeData> logColorSchemes = [logRed, logBlue, logSerikaDark];
}
