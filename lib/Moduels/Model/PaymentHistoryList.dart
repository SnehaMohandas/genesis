class PaymentHistoryList {
  bool? status;
  List<Payments>? payments;

  PaymentHistoryList({this.status, this.payments});

  PaymentHistoryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  int? id;
  String? userId;
  String? schemeId;
  String? amount;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? lastPayment;

  Payments(
      {this.id,
        this.userId,
        this.schemeId,
        this.amount,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.lastPayment});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    schemeId = json['scheme_id'];
    amount = json['amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
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
    data['last_payment'] = this.lastPayment;
    return data;
  }
}
