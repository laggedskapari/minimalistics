import 'dart:ui';

Color primaryColor = const Color.fromARGB(255, 226, 183, 20);
Color labelColor = const Color.fromARGB(255, 100, 102, 105);
Color errorColor = const Color.fromARGB(255, 202, 71, 84);
Color successColor = const Color.fromARGB(255, 71, 202, 73);
Color backgroundColor = const  Color.fromARGB(255, 50, 52, 55);
Color darkBackgroundColor = const  Color.fromARGB(255, 35, 36, 37);

TextStyle primaryTextStyle = TextStyle(color: primaryColor, fontFamily: 'JetBrainsMono');
TextStyle primaryLabelTextStyle = TextStyle(color: labelColor, fontFamily: 'JetBrainsMono', fontWeight: FontWeight.w900);
TextStyle completedTextStyle = TextStyle(color: labelColor, fontFamily: 'JetBrainsMono', fontWeight: FontWeight.w900, fontStyle: FontStyle.italic);
TextStyle errorTextStyle = TextStyle(color: errorColor, fontFamily: 'JetBrainsMono');
TextStyle successTextStyle = TextStyle(color: successColor, fontFamily: 'JetBrainsMono');