class Result {
  Result({
    required this.checkInTime,
  });

  Result.fromJson(dynamic json) {
    checkInTime = json['check_in_time'];
  }
  late String checkInTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['check_in_time'] = checkInTime;
    return map;
  }
}
