class NearbyModel {
  List<NearbyClub>? clubs;

  NearbyModel({this.clubs});

  NearbyModel.fromJson(Map<String, dynamic> json) {
    if (json['Clubs'] != null) {
      clubs = <NearbyClub>[];
      json['Clubs'].forEach((v) {
        clubs!.add(new NearbyClub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clubs != null) {
      data['Clubs'] = this.clubs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearbyClub {
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
  String? distance;

  NearbyClub(
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
      this.distance});

  NearbyClub.fromJson(Map<String, dynamic> json) {
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
    distance = json['distance'];
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
    data['distance'] = this.distance;
    return data;
  }
}
