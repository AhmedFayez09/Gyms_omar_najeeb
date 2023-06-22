class RulesModel {
  List<Rules>? rules;

  RulesModel({this.rules});

  RulesModel.fromJson(Map<String, dynamic> json) {
    if (json['rules'] != null) {
      rules = <Rules>[];
      json['rules'].forEach((v) {
        rules!.add(new Rules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rules != null) {
      data['rules'] = this.rules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rules {
  String? sId;
  String? type;
  String? paymentType;
  String? clientId;
  String? clientSecert;
  String? mode;
  bool? active;
  List<Questions>? questions;
  int? iV;
  String? textBody;
  String? facebook;
  String? whatsapp;
  String? phone1;
  String? phone2;
  String? location1;
  String? location2;
  String? instagram;
  String? mainImg;
  String? mainLogo;
  String? appBg;
  String? appBgType;
  String? bannerImg;

  Rules(
      {this.sId,
      this.type,
      this.paymentType,
      this.clientId,
      this.clientSecert,
      this.mode,
      this.active,
      this.questions,
      this.iV,
      this.textBody,
      this.facebook,
      this.whatsapp,
      this.phone1,
      this.phone2,
      this.location1,
      this.location2,
      this.instagram,
      this.mainImg,
      this.mainLogo,
      this.appBg,
      this.appBgType,
      this.bannerImg});

  Rules.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    paymentType = json['payment_type'];
    clientId = json['clientId'];
    clientSecert = json['clientSecert'];
    mode = json['mode'];
    active = json['active'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    iV = json['__v'];
    textBody = json['textBody'];
    facebook = json['facebook'];
    whatsapp = json['whatsapp'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    location1 = json['location1'];
    location2 = json['location2'];
    instagram = json['instagram'];
    mainImg = json['main_img'];
    mainLogo = json['main_logo'];
    appBg = json['app_bg'];
    appBgType = json['app_bg_type'];
    bannerImg = json['banner_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['payment_type'] = this.paymentType;
    data['clientId'] = this.clientId;
    data['clientSecert'] = this.clientSecert;
    data['mode'] = this.mode;
    data['active'] = this.active;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['textBody'] = this.textBody;
    data['facebook'] = this.facebook;
    data['whatsapp'] = this.whatsapp;
    data['phone1'] = this.phone1;
    data['phone2'] = this.phone2;
    data['location1'] = this.location1;
    data['location2'] = this.location2;
    data['instagram'] = this.instagram;
    data['main_img'] = this.mainImg;
    data['main_logo'] = this.mainLogo;
    data['app_bg'] = this.appBg;
    data['app_bg_type'] = this.appBgType;
    data['banner_img'] = this.bannerImg;
    return data;
  }
}

class Questions {
  String? question;
  String? answer;

  Questions({this.question, this.answer});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
