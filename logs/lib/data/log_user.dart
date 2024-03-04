class LogUser {
  String logId;
  String username;
  int points;
  List<String> successes = [];
  List<String> failures = [];
  List<String> habits = [];
  List<String> challenges = [];

  LogUser({
    required this.logId,
    required this.username,
    this.points = 0,
  });
}
