class FavoriteModel {
  List<FavoriteModelData>? data;

  FavoriteModel({this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteModelData>[];
      json['data'].forEach((v) {
        data!.add(new FavoriteModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FavoriteModelData {
  String? sId;
  String? user;
  String? clubId;
  String? clubName;
  String? price;
  String? clubLogo;
  int? iV;

  FavoriteModelData(
      {this.sId,
      this.user,
      this.clubId,
      this.clubName,
      this.price,
      this.clubLogo,
      this.iV});

  FavoriteModelData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    clubId = json['club_id'];
    clubName = json['club_name'];
    price = json['price'];
    clubLogo = json['club_logo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['club_id'] = this.clubId;
    data['club_name'] = this.clubName;
    data['price'] = this.price;
    data['club_logo'] = this.clubLogo;
    data['__v'] = this.iV;
    return data;
  }
}
