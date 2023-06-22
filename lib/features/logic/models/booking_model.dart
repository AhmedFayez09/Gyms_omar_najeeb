class BookingModel {
  List<Subs>? subs;

  BookingModel({this.subs});

  BookingModel.fromJson(Map<String, dynamic> json) {
    if (json['subs'] != null) {
      subs = <Subs>[];
      json['subs'].forEach((v) {
        subs!.add(new Subs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subs != null) {
      data['subs'] = this.subs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subs {
  String? sId;
  String? clubId;
  String? clubName;
  String? clubDays;
  String? clubLogo;
  String? startDate;
  String? endDate;
  bool? expired;
  int? price;
  String? type;
  dynamic expireIn;

  Subs(
      {this.sId,
      this.clubId,
      this.clubName,
      this.clubDays,
      this.clubLogo,
      this.startDate,
      this.endDate,
      this.expired,
      this.price,
      this.type,
      this.expireIn});

  Subs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    clubDays = json['club_days'];
    clubLogo = json['club_logo'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    expired = json['expired'];
    price = json['price'];
    type = json['type'];
    expireIn = json['expire_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['club_days'] = this.clubDays;
    data['club_logo'] = this.clubLogo;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['expired'] = this.expired;
    data['price'] = this.price;
    data['type'] = this.type;
    data['expire_in'] = this.expireIn;
    return data;
  }
}
