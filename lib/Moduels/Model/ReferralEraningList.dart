class ReferralEarningList {
  bool? status;
  List<Data>? data;

  ReferralEarningList({this.status, this.data});

  ReferralEarningList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? subscriptionId;
  String? referalId;
  String? schemeId;
  String? referalAmount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? registerid;
  String? schemeName;

  Data(
      {this.id,
        this.userId,
        this.subscriptionId,
        this.referalId,
        this.schemeId,
        this.referalAmount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.registerid,
        this.schemeName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subscriptionId = json['subscription_id'];
    referalId = json['referal_id'];
    schemeId = json['scheme_id'];
    referalAmount = json['referal_amount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    registerid = json['registerid'];
    schemeName = json['scheme_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['subscription_id'] = this.subscriptionId;
    data['referal_id'] = this.referalId;
    data['scheme_id'] = this.schemeId;
    data['referal_amount'] = this.referalAmount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['registerid'] = this.registerid;
    data['scheme_name'] = this.schemeName;
    return data;
  }
}
