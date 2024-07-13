class CourseResponse {
  int? id;
  String? name;
  int? categoryId;
  String? categoryName;

  CourseResponse({this.id, this.name, this.categoryId, this.categoryName});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    return data;
  }
}