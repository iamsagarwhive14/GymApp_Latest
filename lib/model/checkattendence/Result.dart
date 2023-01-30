class Result {
  Result({
    required this.checkIn,
    required this.checkOut,
    required this.checkInTime,
    required this.checkOutTime,
  });

  Result.fromJson(dynamic json) {
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
  }
  late bool checkIn;
  late bool checkOut;
  late String checkInTime;
  late String checkOutTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['check_in'] = checkIn;
    map['check_out'] = checkOut;
    map['check_in_time'] = checkInTime;
    map['check_out_time'] = checkOutTime;
    return map;
  }
}
