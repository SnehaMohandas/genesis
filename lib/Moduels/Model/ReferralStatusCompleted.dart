class ReferralStatusCompleted_List {
  bool? status;
  List<Referral>? referral;

  ReferralStatusCompleted_List({this.status, this.referral});

  ReferralStatusCompleted_List.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['referral'] != null) {
      referral = <Referral>[];
      json['referral'].forEach((v) {
        referral!.add(new Referral.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.referral != null) {
      data['referral'] = this.referral!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Referral {
  int? id;
  String? name;
  String? userId;
  String? email;
  String? mobile;
  int? type;
  String? createdAt;
  String? updatedAt;

  Referral(
      {this.id,
        this.name,
        this.userId,
        this.email,
        this.mobile,
        this.type,
        this.createdAt,
        this.updatedAt});

  Referral.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    email = json['email'];
    mobile = json['mobile'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
