class PaymentList {
  bool? status;
  Data? data;

  PaymentList({this.status, this.data});

  PaymentList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? amount;
  String? duration;
  String? createdAt;
  String? updatedAt;
  String? schemeId;
  List<Payment>? payment;

  Data(
      {this.id,
        this.name,
        this.amount,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.schemeId,
        this.payment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    schemeId = json['scheme_id'];
    if (json['payment'] != null) {
      payment = <Payment>[];
      json['payment'].forEach((v) {
        payment!.add(new Payment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['scheme_id'] = this.schemeId;
    if (this.payment != null) {
      data['payment'] = this.payment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payment {
  String? slNo;
  String? amount;
  String? date;

  Payment({this.slNo, this.amount, this.date});

  Payment.fromJson(Map<String, dynamic> json) {
    slNo = json['sl_no'];
    amount = json['amount'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sl_no'] = this.slNo;
    data['amount'] = this.amount;
    data['date'] = this.date;
    return data;
  }
}
