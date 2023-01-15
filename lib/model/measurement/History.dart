class History {
  History({
    required this.bicep,
    required this.calf,
    required this.chest,
    required this.forearm,
    required this.hips,
    required this.neck,
    required this.shoulder,
    required this.thigh,
    required this.waist,
    required this.weight,
    required this.status,
    required this.date,
  });

  History.fromJson(dynamic json) {
    bicep = json['bicep'];
    calf = json['calf'];
    chest = json['chest'];
    forearm = json['forearm'];
    hips = json['hips'];
    neck = json['neck'];
    shoulder = json['shoulder'];
    thigh = json['thigh'];
    waist = json['waist'];
    weight = json['weight'];
    status = json['status'];
    date = json['date'];
  }
  late String bicep;
  late String calf;
  late String chest;
  late String forearm;
  late String hips;
  late String neck;
  late String shoulder;
  late String thigh;
  late String waist;
  late String weight;
  late String status;
  late String date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bicep'] = bicep;
    map['calf'] = calf;
    map['chest'] = chest;
    map['forearm'] = forearm;
    map['hips'] = hips;
    map['neck'] = neck;
    map['shoulder'] = shoulder;
    map['thigh'] = thigh;
    map['waist'] = waist;
    map['weight'] = weight;
    map['status'] = status;
    map['date'] = date;
    return map;
  }
}
