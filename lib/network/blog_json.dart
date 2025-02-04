class Blog {
  int? id;
  String? imageUrl;
  String? title;
  String? body;

  Blog({this.id, this.imageUrl, this.title, this.body});

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
