import 'Result.dart';

class PaymentHistoryData {
  PaymentHistoryData({
    required this.response,
    required this.msg,
    required this.result,
  });

  PaymentHistoryData.fromJson(dynamic json) {
    response = json['response'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
  }
  bool? response;
  String? msg;
  List<Result>? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = response;
    map['msg'] = msg;
    final result = this.result;
    if (result != null) {
      map['result'] = result.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
