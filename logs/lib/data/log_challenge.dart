class LogChallenge {
  String challengeTitle;
  String challengeDescription;
  Map<String, int> contenderScore = {};
  String createdOn;
  String createdBy;
  int freezeCount;

  LogChallenge({
    required this.challengeTitle,
    required this.challengeDescription,
    required this.createdOn,
    required this.createdBy,
    required this.freezeCount,
  });
}
