class UpcomingEvents {
  int? id;
  String? name;
  String? imageUrl;
  String? address;
  String? details;

  UpcomingEvents(
      {this.id, this.name, this.imageUrl, this.address, this.details});

  UpcomingEvents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    address = json['address'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['address'] = this.address;
    data['details'] = this.details;
    return data;
  }
}
