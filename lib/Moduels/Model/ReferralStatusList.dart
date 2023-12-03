class ReferralStatusList {
  bool? status;
  List<ReferralStatus>? referralStatus;

  ReferralStatusList({this.status, this.referralStatus});

  ReferralStatusList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['referral_status'] != null) {
      referralStatus = <ReferralStatus>[];
      json['referral_status'].forEach((v) {
        referralStatus!.add(new ReferralStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.referralStatus != null) {
      data['referral_status'] =
          this.referralStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReferralStatus {
  int? userId;
  String? userName;
  int? paymentId;
  String? amount;
  String? paymentDate;
  int? paymentStatus;
  String? paymentStatusName;

  ReferralStatus(
      {this.userId,
        this.userName,
        this.paymentId,
        this.amount,
        this.paymentDate,
        this.paymentStatus,
        this.paymentStatusName});

  ReferralStatus.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    paymentId = json['payment_id'];
    amount = json['amount'];
    paymentDate = json['payment_date'];
    paymentStatus = json['payment_status'];
    paymentStatusName = json['payment_status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['payment_id'] = this.paymentId;
    data['amount'] = this.amount;
    data['payment_date'] = this.paymentDate;
    data['payment_status'] = this.paymentStatus;
    data['payment_status_name'] = this.paymentStatusName;
    return data;
  }
}