import 'Current.dart';
import 'History.dart';

class Result {
  Result({
    required this.current,
    required this.history,
  });

  Result.fromJson(dynamic json) {
    current =
        (json['current'] != null ? Current.fromJson(json['current']) : null)!;
    if (json['history'] != null) {
      history = [];
      json['history'].forEach((v) {
        history.add(History.fromJson(v));
      });
    }
  }
  late Current current;
  late List<History> history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (current != null) {
      map['current'] = current.toJson();
    }
    if (history != null) {
      map['history'] = history.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
