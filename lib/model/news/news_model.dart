class NewsModel {
  bool? response;
  String? msg;
  List<Result>? result;

  NewsModel({this.response, this.msg, this.result});

  NewsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? title;
  String? description;
  String? image;
  String? source;
  String? publishDate;

  Result(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.source,
      this.publishDate});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    source = json['source'];
    publishDate = json['publish_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['source'] = this.source;
    data['publish_date'] = this.publishDate;
    return data;
  }
}
