class ReferralCode {
  bool? status;
  String? userName;
  String? referralCode;

  ReferralCode({this.status, this.userName, this.referralCode});

  ReferralCode.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userName = json['user_name'];
    referralCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_name'] = this.userName;
    data['referral_code'] = this.referralCode;
    return data;
  }
}
