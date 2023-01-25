class Result {
  Result({
    required this.checkOutTime,
  });

  Result.fromJson(dynamic json) {
    checkOutTime = json['check_out_time'];
  }
  late String checkOutTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['check_out_time'] = checkOutTime;
    return map;
  }
}
