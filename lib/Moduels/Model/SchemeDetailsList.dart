class SchemeDetailsList {
  bool? status;
  Data? data;

  SchemeDetailsList({this.status, this.data});

  SchemeDetailsList.fromJson(Map<String, dynamic> json) {
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
  String? startingOn;
  String? endingOn;
  String? total;

  Data(
      {this.id,
        this.name,
        this.amount,
        this.duration,
        this.createdAt,
        this.updatedAt,
        this.startingOn,
        this.endingOn,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    startingOn = json['starting_on'];
    endingOn = json['ending_on'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['starting_on'] = this.startingOn;
    data['ending_on'] = this.endingOn;
    data['total'] = this.total;
    return data;
  }
}
