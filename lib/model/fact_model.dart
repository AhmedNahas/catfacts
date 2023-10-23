class Fact {
  Status? status;
  String? id;
  String? user;
  String? text;
  String? type;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  int? v;

  Fact(
      {this.status,
      this.id,
      this.user,
      this.text,
      this.type,
      this.deleted,
      this.createdAt,
      this.updatedAt,
      this.v});

  Fact.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    id = json['_id'];
    user = json['user'];
    text = json['text'];
    type = json['type'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
}

class Status {
  bool? verified;
  int? sentCount;

  Status.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }
}
