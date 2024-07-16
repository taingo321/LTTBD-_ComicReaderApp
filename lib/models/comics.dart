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
            sId: json['_id'],
            title: json['title'],
            timestamp: json['timestamp'],
            thumbnailComic: json['thumbnailComic'],
            author: json['author'],
            description: json['description'],
            view: json['view'],
            rating: json['rating'],
            genres: (json['genres'] as List<dynamic>).cast<String>(),
            chapters: json['chapters'] != null
                ? (json['chapters'] as List)
                .map((v) => Chapters.fromJson(v))
                .toList()
                : null,
            iV: json['__v'],
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
        if (chapters != null) {
            data['chapters'] = chapters!.map((v) => v.toJson()).toList();
        }
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
            title: json['title'],
            timestamp: json['timestamp'],
            images: json['images'] != null
                ? (json['images'] as List)
                .map((v) => Images.fromJson(v))
                .toList()
                : null,
            sId: json['_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['title'] = title;
        data['timestamp'] = timestamp;
        if (images != null) {
            data['images'] = images!.map((v) => v.toJson()).toList();
        }
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
            imageUrl: json['image_url'],
            sId: json['_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['image_url'] = imageUrl;
        data['_id'] = sId;
        return data;
    }
}
