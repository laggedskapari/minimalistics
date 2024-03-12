class LogHabit {
  String habitId;
  String habitTitle;
  String habitDescription;
  int timePeriod;
  DateTime createdOn;
  int freezes;
  int streak;
  int daysLeft;
  String createdBy;
  bool isSuccess;

  LogHabit({
    required this.habitId,
    required this.habitTitle,
    required this.habitDescription,
    required this.createdBy,
    required this.streak,
    required this.daysLeft,
    required this.timePeriod,
    required this.freezes,
    required this.createdOn,
    required this.isSuccess,
  });
}
