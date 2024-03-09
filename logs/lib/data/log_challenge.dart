class LogChallenge {
  String challengeTitle;
  String challengeDescription;
  DateTime createdOn;
  String createdBy;
  int freezeCount;
  int timePeriod;
  int daysLeft;
  List<String> contenderList;

  LogChallenge({
    required this.challengeTitle,
    required this.challengeDescription,
    required this.daysLeft,
    required this.timePeriod,
    required this.createdOn,
    required this.createdBy,
    required this.freezeCount,
    required this.contenderList,
  });
}
