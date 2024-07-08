class PostsModel {

  int? id;
  String? name;
  String? courseName;

  PostsModel({this.id, this.name, this.courseName});

  PostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['course_name'] = this.courseName;
    return data;
  }
  // int? userId;
  // int? id;
  // String? title;
  // String? body;
  //
  // PostsModel({this.userId, this.id, this.title, this.body});
  //
  // PostsModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userId'] = this.userId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   return data;
  // }
}