class Result {
  Result({
    required this.subscription,
    required this.fiscalYear,
    required this.paymentAmount,
    required this.paymentMode,
    required this.paymentDate,
  });

  Result.fromJson(dynamic json) {
    subscription = json['subscription'];
    fiscalYear = json['fiscal_year'];
    paymentAmount = json['payment_amount'];
    paymentMode = json['payment_mode'];
    paymentDate = json['payment_date'];
  }
  String? subscription;
  String? fiscalYear;
  String? paymentAmount;
  String? paymentMode;
  String? paymentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subscription'] = subscription;
    map['fiscal_year'] = fiscalYear;
    map['payment_amount'] = paymentAmount;
    map['payment_mode'] = paymentMode;
    map['payment_date'] = paymentDate;
    return map;
  }
}
