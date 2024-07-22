class Genre {
  String? sId;
  String? genreName;
  int? iV;

  Genre({this.sId, this.genreName, this.iV});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      sId: json['_id'],
      genreName: json['genreName'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['genreName'] = this.genreName;
    data['__v'] = this.iV;
    return data;
  }
}
