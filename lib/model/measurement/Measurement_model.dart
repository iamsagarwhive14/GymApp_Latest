class MeasurementModel {
  bool? response;
  String? msg;
  List<Result>? result;

  MeasurementModel({this.response, this.msg, this.result});

  MeasurementModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? bicep;
  String? calf;
  String? chest;
  String? forearm;
  String? hips;
  String? neck;
  String? shoulder;
  String? thigh;
  String? waist;
  String? weight;
  String? status;
  String? date;

  Result(
      {this.bicep,
      this.calf,
      this.chest,
      this.forearm,
      this.hips,
      this.neck,
      this.shoulder,
      this.thigh,
      this.waist,
      this.weight,
      this.status,
      this.date});

  Result.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bicep'] = this.bicep;
    data['calf'] = this.calf;
    data['chest'] = this.chest;
    data['forearm'] = this.forearm;
    data['hips'] = this.hips;
    data['neck'] = this.neck;
    data['shoulder'] = this.shoulder;
    data['thigh'] = this.thigh;
    data['waist'] = this.waist;
    data['weight'] = this.weight;
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }
}
