class WalletModel {
  List<WalletModelSubs>? subs;
  int? wallet;
  int? totalPrice;

  WalletModel({this.subs, this.wallet, this.totalPrice});

  WalletModel.fromJson(Map<String, dynamic> json) {
    if (json['subs'] != null) {
      subs = <WalletModelSubs>[];
      json['subs'].forEach((v) {
        subs!.add(new WalletModelSubs.fromJson(v));
      });
    }
    wallet = json['wallet'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subs != null) {
      data['subs'] = this.subs!.map((v) => v.toJson()).toList();
    }
    data['wallet'] = this.wallet;
    data['total_price'] = this.totalPrice;
    return data;
  }
}

class WalletModelSubs {
  String? sId;
  String? clubName;
  String? clubLogo;
  String? startDate;
  String? endDate;
  bool? expired;

  WalletModelSubs(
      {this.sId,
      this.clubName,
      this.clubLogo,
      this.startDate,
      this.endDate,
      this.expired});

  WalletModelSubs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    clubName = json['club_name'];
    clubLogo = json['club_logo'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['club_name'] = this.clubName;
    data['club_logo'] = this.clubLogo;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['expired'] = this.expired;
    return data;
  }
}
