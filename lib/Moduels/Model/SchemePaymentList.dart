class SchemePaymentList {
  bool? status;
  List<Payments>? payments;

  SchemePaymentList({this.status, this.payments});

  SchemePaymentList.fromJson(Map<String, dynamic> json) {
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
  String? paymentAmount;
  String? paymentDate;
  String? createdAt;
  String? updatedAt;
  String? status;
  int? subscriptionId;
  String? paymentDates;
  bool? isCurrentMonth;

  Payments(
      {this.id,
        this.userId,
        this.schemeId,
        this.paymentAmount,
        this.paymentDate,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.subscriptionId,
        this.paymentDates,
        this.isCurrentMonth});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    schemeId = json['scheme_id'];
    paymentAmount = json['payment_amount'];
    paymentDate = json['payment_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    subscriptionId = json['subscription_id'];
    paymentDates = json['payment_dates'];
    isCurrentMonth = json['is_current_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['scheme_id'] = this.schemeId;
    data['payment_amount'] = this.paymentAmount;
    data['payment_date'] = this.paymentDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['subscription_id'] = this.subscriptionId;
    data['payment_dates'] = this.paymentDates;
    data['is_current_month'] = this.isCurrentMonth;
    return data;
  }
}
