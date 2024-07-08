
class FormSelectResponseList {
  List<Country>? country;
  List<Curriculum>? curriculum;
  List<TuitionType>? tuitionType;
  List<HearAboutUs>? hearAboutUs;
  List<Categories>? categories;

  FormSelectResponseList(
      {this.country,
        this.curriculum,
        this.tuitionType,
        this.hearAboutUs,
        this.categories});

  FormSelectResponseList.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(new Country.fromJson(v));
      });
    }
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(new Curriculum.fromJson(v));
      });
    }
    if (json['tuitionType'] != null) {
      tuitionType = <TuitionType>[];
      json['tuitionType'].forEach((v) {
        tuitionType!.add(new TuitionType.fromJson(v));
      });
    }
    if (json['hearAboutUs'] != null) {
      hearAboutUs = <HearAboutUs>[];
      json['hearAboutUs'].forEach((v) {
        hearAboutUs!.add(new HearAboutUs.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.country != null) {
      data['country'] = this.country!.map((v) => v.toJson()).toList();
    }
    if (this.curriculum != null) {
      data['curriculum'] = this.curriculum!.map((v) => v.toJson()).toList();
    }
    if (this.tuitionType != null) {
      data['tuitionType'] = this.tuitionType!.map((v) => v.toJson()).toList();
    }
    if (this.hearAboutUs != null) {
      data['hearAboutUs'] = this.hearAboutUs!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HearAboutUs {
  int? id;
  String? name;

  HearAboutUs({this.id, this.name});

  HearAboutUs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class TuitionType {
  int? id;
  String? name;

  TuitionType({this.id, this.name});

  TuitionType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class Curriculum {
  int? id;
  String? name;

  Curriculum({this.id, this.name});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}