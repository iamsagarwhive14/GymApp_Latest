class Result {
  Result({
    required this.name,
    required this.logo,
    required this.url,
    required this.gymId,
  });

  Result.fromJson(dynamic json) {
    name = json['name'];
    logo = json['logo'];
    url = json['url'];
    gymId = json['gym_id'];
  }
  late String name;
  late String logo;
  late String url;
  late String gymId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['logo'] = logo;
    map['url'] = url;
    map['gym_id'] = gymId;
    return map;
  }
}
