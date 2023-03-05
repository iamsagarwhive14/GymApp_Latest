class OrderModel {
  bool? response;
  String? msg;
  String? result;

  OrderModel({this.response, this.msg, this.result});

  OrderModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    msg = json['msg'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['msg'] = this.msg;
    data['result'] = this.result;
    return data;
  }
}
