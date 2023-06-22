class AllClubsModel {
  List<Clubs>? clubs;

  AllClubsModel({this.clubs});

  AllClubsModel.fromJson(Map<String, dynamic> json) {
    if (json['Clubs'] != null) {
      clubs = <Clubs>[];
      json['Clubs'].forEach((v) {
        clubs!.add(new Clubs.fromJson(v));
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

class Clubs {
  String? sId;
  String? name;
  String? gender;
  String? days;
  String? from;
  String? to;
  String? city;
  String? lat;
  String? description;
  List<String>? images;
  String? location;
  int? iV;

  Clubs(
      {this.sId,
      this.name,
      this.gender,
      this.days,
      this.from,
      this.to,
      this.city,
      this.lat,
      this.description,
      this.images,
      this.location,
      this.iV});

  Clubs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    days = json['days'];
    from = json['from'];
    to = json['to'];
    city = json['city'];
    lat = json['lat'];
    description = json['description'];
    images = json['images'].cast<String>();
    location = json['location'];
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
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['description'] = this.description;
    data['images'] = this.images;
    data['location'] = this.location;
    data['__v'] = this.iV;
    return data;
  }
}
