class CheckOutModel {
  bool? response;
  String? msg;
  Result? result;

  CheckOutModel({this.response, this.msg, this.result});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    msg = json['msg'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? checkInTime;

  Result({this.checkInTime});

  Result.fromJson(Map<String, dynamic> json) {
    checkInTime = json['check_in_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_in_time'] = this.checkInTime;
    return data;
  }
}
