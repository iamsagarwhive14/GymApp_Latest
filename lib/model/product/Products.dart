class Products {
  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.image,
    required this.createdAt,
    this.updatedAt,
    required this.link,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    link = json['link'];
  }
  late int id;
  late String name;
  late String description;
  late String price;
  late String status;
  late String image;
  late String createdAt;
  late dynamic updatedAt;
  late String link;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['status'] = status;
    map['image'] = image;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['link'] = link;
    return map;
  }
}
