class ActiveSchemeDetailsList {
  bool? status;
  SchemeDetails? schemeDetails;
  List<Payments>? payments;
  String? total;
  String? remaining;

  ActiveSchemeDetailsList(
      {this.status,
        this.schemeDetails,
        this.payments,
        this.total,
        this.remaining});

  ActiveSchemeDetailsList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    schemeDetails = json['scheme_details'] != null
        ? new SchemeDetails.fromJson(json['scheme_details'])
        : null;
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    total = json['total'];
    remaining = json['remaining'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.schemeDetails != null) {
      data['scheme_details'] = this.schemeDetails!.toJson();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['remaining'] = this.remaining;
    return data;
  }
}

class SchemeDetails {
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
  String? pending;
  String? lastPayment;
  Scheme? scheme;

  SchemeDetails(
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
        this.pending,
        this.lastPayment,
        this.scheme});

  SchemeDetails.fromJson(Map<String, dynamic> json) {
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
    pending = json['pending'];
    lastPayment = json['last_payment'];
    scheme =
    json['scheme'] != null ? new Scheme.fromJson(json['scheme']) : null;
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
    data['pending'] = this.pending;
    data['last_payment'] = this.lastPayment;
    if (this.scheme != null) {
      data['scheme'] = this.scheme!.toJson();
    }
    return data;
  }
}

class Scheme {
  int? id;
  String? name;
  String? amount;
  String? duration;
  String? createdAt;
  String? updatedAt;

  Scheme(
      {this.id,
        this.name,
        this.amount,
        this.duration,
        this.createdAt,
        this.updatedAt});

  Scheme.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String? subscriptionId;
  bool? isCurrentMonth;
  String? statusName;

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
        this.isCurrentMonth,
        this.statusName});

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
    isCurrentMonth = json['is_current_month'];
    statusName = json['status_name'];
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
    data['is_current_month'] = this.isCurrentMonth;
    data['status_name'] = this.statusName;
    return data;
  }
}
