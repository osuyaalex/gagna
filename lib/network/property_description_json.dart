class PropertyDescription {
  bool? success;
  Data? data;

  PropertyDescription({this.success, this.data});

  PropertyDescription.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Detail? detail;

  Data({this.detail});

  Data.fromJson(Map<String, dynamic> json) {
    detail =
    json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail!.toJson();
    }
    return data;
  }
}

class Detail {
  int? id;
  String? name;
  String? location;
  String? pricePerShare;
  int? totalShares;
  int? sharesSold;
  String? projectDuration;
  String? projectDetails;
  String? imageUrl;
  int? sharesAvailable;
  List<Amenities>? amenities;
  String? projectInformation;
  String? projectedReturn;
  String? projectedPayoutDate;

  Detail(
      {this.id,
        this.name,
        this.location,
        this.pricePerShare,
        this.totalShares,
        this.sharesSold,
        this.projectDuration,
        this.projectDetails,
        this.imageUrl,
        this.sharesAvailable,
        this.amenities,
        this.projectInformation,
        this.projectedReturn,
        this.projectedPayoutDate});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    pricePerShare = json['price_per_share'];
    totalShares = json['total_shares'];
    sharesSold = json['shares_sold'];
    projectDuration = json['project_duration'];
    projectDetails = json['project_details'];
    imageUrl = json['image_url'];
    sharesAvailable = json['shares_available'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(new Amenities.fromJson(v));
      });
    }
    projectInformation = json['project_information'];
    projectedReturn = json['projected_return'];
    projectedPayoutDate = json['projected_payout_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['price_per_share'] = this.pricePerShare;
    data['total_shares'] = this.totalShares;
    data['shares_sold'] = this.sharesSold;
    data['project_duration'] = this.projectDuration;
    data['project_details'] = this.projectDetails;
    data['image_url'] = this.imageUrl;
    data['shares_available'] = this.sharesAvailable;
    if (this.amenities != null) {
      data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
    }
    data['project_information'] = this.projectInformation;
    data['projected_return'] = this.projectedReturn;
    data['projected_payout_date'] = this.projectedPayoutDate;
    return data;
  }
}

class Amenities {
  int? id;
  String? name;

  Amenities({this.id, this.name});

  Amenities.fromJson(Map<String, dynamic> json) {
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
