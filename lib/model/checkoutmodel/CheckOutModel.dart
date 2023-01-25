import 'Result.dart';

class CheckOutModel {
  CheckOutModel({
    required this.response,
    required this.msg,
    required this.result,
  });

  CheckOutModel.fromJson(dynamic json) {
    response = json['response'];
    msg = json['msg'];
    result = (json['result'] != null ? Result.fromJson(json['result']) : null)!;
  }
  late bool response;
  late String msg;
  late Result result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = response;
    map['msg'] = msg;
    if (result != null) {
      map['result'] = result.toJson();
    }
    return map;
  }
}
