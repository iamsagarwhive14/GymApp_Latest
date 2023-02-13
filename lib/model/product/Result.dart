import 'Products.dart';

class Result {
  Result({
    required this.products,
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
    required this.nextPage,
    required this.previousPage,
    required this.lastPage,
    required this.firstPage,
  });

  Result.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    nextPage = json['next_page'];
    previousPage = json['previous_page'];
    lastPage = json['last_page'];
    firstPage = json['first_page'];
  }
  late List<Products> products;
  late int total;
  late int count;
  late int perPage;
  late int currentPage;
  late int totalPages;
  late String nextPage;
  late String previousPage;
  late String lastPage;
  late String firstPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['count'] = count;
    map['per_page'] = perPage;
    map['current_page'] = currentPage;
    map['total_pages'] = totalPages;
    map['next_page'] = nextPage;
    map['previous_page'] = previousPage;
    map['last_page'] = lastPage;
    map['first_page'] = firstPage;
    return map;
  }
}
