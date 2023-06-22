class BestModel {
  List<BestClub>? clubs;

  BestModel({this.clubs});

  BestModel.fromJson(Map<String, dynamic> json) {
    if (json['Clubs'] != null) {
      clubs = <BestClub>[];
      json['Clubs'].forEach((v) {
        clubs!.add(new BestClub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clubs != null) {
      data['Clubs'] = clubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestClub {
  String? sId;
  String? name;
  String? gender;
  String? days;
  String? from;
  String? to;
  String? country;
  String? city;
  String? lat;
  String? long;
  String? description;
  List<String>? images;
  String? location;
  String? logo;
  int? commission;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Subscriptions>? subscriptions;

  BestClub(
      {this.sId,
      this.name,
      this.gender,
      this.days,
      this.from,
      this.to,
      this.country,
      this.city,
      this.lat,
      this.long,
      this.description,
      this.images,
      this.location,
      this.logo,
      this.commission,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.subscriptions});

  BestClub.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    days = json['days'];
    from = json['from'];
    to = json['to'];
    country = json['country'];
    city = json['city'];
    lat = json['lat'];
    long = json['long'];
    description = json['description'];
    images = json['images'].cast<String>();
    location = json['location'];
    logo = json['logo'];
    commission = json['commission'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['gender'] = gender;
    data['days'] = days;
    data['from'] = from;
    data['to'] = to;
    data['country'] = country;
    data['city'] = city;
    data['lat'] = lat;
    data['long'] = long;
    data['description'] = description;
    data['images'] = images;
    data['location'] = location;
    data['logo'] = logo;
    data['commission'] = commission;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (subscriptions != null) {
      data['subscriptions'] =
          subscriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptions {
  String? sId;
  String? user;
  String? club;
  String? subscription;
  String? startDate;
  String? endDate;
  bool? expired;
  int? code;
  int? iV;

  Subscriptions(
      {this.sId,
      this.user,
      this.club,
      this.subscription,
      this.startDate,
      this.endDate,
      this.expired,
      this.code,
      this.iV});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    club = json['club'];
    subscription = json['subscription'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    expired = json['expired'];
    code = json['code'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['user'] = user;
    data['club'] = club;
    data['subscription'] = subscription;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['expired'] = expired;
    data['code'] = code;
    data['__v'] = iV;
    return data;
  }
}
