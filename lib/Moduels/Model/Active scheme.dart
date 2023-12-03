class ActiveSchemeList {
  bool? status;
  List<Data>? data;

  ActiveSchemeList({this.status, this.data});

  ActiveSchemeList.fromJson(Map<String, dynamic> json) {
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
  String? schemeId;
  String? amount;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? month;
  String? slNo;
  String? lastPayment;

  Data(
      {this.id,
        this.userId,
        this.schemeId,
        this.amount,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.month,
        this.slNo,
        this.lastPayment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    schemeId = json['scheme_id'];
    amount = json['amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    month = json['month'];
    slNo = json['sl_no'];
    lastPayment = json['last_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['scheme_id'] = this.schemeId;
    data['amount'] = this.amount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['month'] = this.month;
    data['sl_no'] = this.slNo;
    data['last_payment'] = this.lastPayment;
    return data;
  }
}
