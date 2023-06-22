class ClubDetailsModel {
  Club? club;
  String? distance;
  List<Subscriptions>? subscriptions;

  ClubDetailsModel({this.club, this.distance, this.subscriptions});

  ClubDetailsModel.fromJson(Map<String, dynamic> json) {
    club = json['club'] != null ? new Club.fromJson(json['club']) : null;
    distance = json['distance'];
    if (json['subscriptions'] != null) {
      subscriptions = <Subscriptions>[];
      json['subscriptions'].forEach((v) {
        subscriptions!.add(new Subscriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.club != null) {
      data['club'] = this.club!.toJson();
    }
    data['distance'] = this.distance;
    if (this.subscriptions != null) {
      data['subscriptions'] =
          this.subscriptions!.map((v) => v.toJson()).toList();
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
