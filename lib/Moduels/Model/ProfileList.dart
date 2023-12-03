class ProfileList {
  bool? status;
  String? schemeCount;
  String? sum;
  String? userName;
  String? referralCode;
  String? registerid;

  ProfileList(
      {this.status,
        this.schemeCount,
        this.sum,
        this.userName,
        this.referralCode,
        this.registerid});

  ProfileList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    schemeCount = json['scheme_count'];
    sum = json['sum'];
    userName = json['user_name'];
    referralCode = json['referral_code'];
    registerid = json['registerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['scheme_count'] = this.schemeCount;
    data['sum'] = this.sum;
    data['user_name'] = this.userName;
    data['referral_code'] = this.referralCode;
    data['registerid'] = this.registerid;
    return data;
  }
}
