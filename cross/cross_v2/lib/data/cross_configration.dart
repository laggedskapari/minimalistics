import 'package:isar/isar.dart';

part 'cross_configration.g.dart';

@collection
class CrossConfigration {
  Id id = Isar.autoIncrement;
  String crossConfId;
  String currentTheme;

  CrossConfigration({required this.currentTheme, this.crossConfId = 'adalovelace'});
}
