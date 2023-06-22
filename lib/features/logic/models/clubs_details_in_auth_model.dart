class ClubDetailsInAuthModel {
  Club? club;
  bool? isFave;
  String? distance;
  List<Subscriptions>? subscriptions;
  bool? sub;
  Data? data;

  ClubDetailsInAuthModel(
      {this.club,
      this.isFave,
      this.distance,
      this.subscriptions,
      this.sub,
      this.data});

  ClubDetailsInAuthModel.fromJson(Map<String, dynamic> json) {
    club = json['club'] != null ? new Club.fromJson(json['club']) : null;
    isFave = json['isFave'];
    distance = json['distance'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
    sub = json['sub'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.club != null) {
      data['club'] = this.club!.toJson();
    }
    data['isFave'] = this.isFave;
    data['distance'] = this.distance;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
    }
    data['sub'] = this.sub;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Club {
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

  Club(
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
      this.iV});

  Club.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['days'] = this.days;
    data['from'] = this.from;
    data['to'] = this.to;
    data['country'] = this.country;
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['description'] = this.description;
    data['images'] = this.images;
    data['location'] = this.location;
    data['logo'] = this.logo;
    data['commission'] = this.commission;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Subscriptions {
  String? sId;
  String? club;
  String? name;
  int? price;
  String? type;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Subscriptions(
      {this.sId,
      this.club,
      this.name,
      this.price,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    club = json['club'];
    name = json['name'];
    price = json['price'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['club'] = this.club;
    data['name'] = this.name;
    data['price'] = this.price;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Data {
  String? id;
  String? username;
  String? clubName;
  String? clubLocation;
  String? startDate;
  String? endDate;
  String? subscriptionId;
  String? subscriptionName;
  int? subscriptionPrice;
  int? code;
  bool? expired;

  Data(
      {this.id,
      this.username,
      this.clubName,
      this.clubLocation,
      this.startDate,
      this.endDate,
      this.subscriptionId,
      this.subscriptionName,
      this.subscriptionPrice,
      this.code,
      this.expired});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    clubName = json['club_name'];
    clubLocation = json['club_location'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    subscriptionId = json['subscription_id'];
    subscriptionName = json['subscription_name'];
    subscriptionPrice = json['subscription_price'];
    code = json['code'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['club_name'] = this.clubName;
    data['club_location'] = this.clubLocation;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['subscription_id'] = this.subscriptionId;
    data['subscription_name'] = this.subscriptionName;
    data['subscription_price'] = this.subscriptionPrice;
    data['code'] = this.code;
    data['expired'] = this.expired;
    return data;
  }
}
