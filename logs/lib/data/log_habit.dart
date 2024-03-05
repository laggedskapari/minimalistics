class LogHabit {
  String habitTitle;
  String habitDescription;
  DateTime createdOn;
  int freezes;
  String createdBy;
  bool isSuccess;

  LogHabit({
    required this.habitTitle,
    required this.habitDescription,
    required this.createdBy,
    required this.freezes,
    required this.createdOn,
    required this.isSuccess,
  });
}
