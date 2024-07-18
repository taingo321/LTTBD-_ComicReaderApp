class Comic {
    String sId;
    String title;
    String timestamp;
    String thumbnailComic;
    String author;
    String description;
    String view;
    String rating;
    List<String>? genres;
    List<Chapters>? chapters;
    int? iV;

    Comic({
        required this.sId,
        required this.title,
        required this.timestamp,
        required this.thumbnailComic,
        required this.author,
        required this.description,
        required this.view,
        required this.rating,
        this.genres,
        this.chapters,
        this.iV,
    });

    factory Comic.fromJson(Map<String, dynamic> json) {
        return Comic(
            sId: json['_id'] ?? '',
            title: json['title'] ?? '',
            timestamp: json['timestamp'] ?? '',
            thumbnailComic: json['thumbnailComic'] ?? '',
            author: json['author'] ?? '',
            description: json['description'] ?? '',
            view: json['view'] ?? '',
            rating: json['rating'] ?? '',
            genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
            chapters: (json['chapters'] as List<dynamic>?)?.map((v) => Chapters.fromJson(v)).toList(),
            iV: json['__v'] as int?,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['_id'] = sId;
        data['title'] = title;
        data['timestamp'] = timestamp;
        data['thumbnailComic'] = thumbnailComic;
        data['author'] = author;
        data['description'] = description;
        data['view'] = view;
        data['rating'] = rating;
        data['genres'] = genres;
        data['chapters'] = chapters?.map((v) => v.toJson()).toList();
        data['__v'] = iV;
        return data;
    }
}

class Chapters {
    int? title;
    String? timestamp;
    List<Images>? images;
    String? sId;

    Chapters({this.title, this.timestamp, this.images, this.sId});

    factory Chapters.fromJson(Map<String, dynamic> json) {
        return Chapters(
            title: json['title'] as int?,
            timestamp: json['timestamp'] as String?,
            images: (json['images'] as List<dynamic>?)?.map((v) => Images.fromJson(v)).toList(),
            sId: json['_id'] as String?,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['title'] = title;
        data['timestamp'] = timestamp;
        data['images'] = images?.map((v) => v.toJson()).toList();
        data['_id'] = sId;
        return data;
    }
}

class Images {
    String? imageUrl;
    String? sId;

    Images({this.imageUrl, this.sId});

    factory Images.fromJson(Map<String, dynamic> json) {
        return Images(
            imageUrl: json['image_url'] as String?,
            sId: json['_id'] as String?,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['image_url'] = imageUrl;
        data['_id'] = sId;
        return data;
    }
}
