// To parse this JSON data, do
//
//     final newsModal = newsModalFromJson(jsonString);

import 'dart:convert';

NewsModal newsModalFromJson(String str) => NewsModal.fromJson(json.decode(str));

String newsModalToJson(NewsModal data) => json.encode(data.toJson());

class NewsModal {
    NewsModal({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NewsModal.fromJson(Map<String, dynamic> json) => NewsModal(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        required this.source,
        this.author,
        required this.title,
        required this.description,
        required this.url,
        this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    Source source;
    String? author;
    String title;
    String description;
    String url;
    String? urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"]??"",
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
        this.id,
        required this.name,
    });

    Id? id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]??""],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": name,
    };
}

enum Id { REUTERS, BUSINESS_INSIDER }

final idValues = EnumValues({
    "business-insider": Id.BUSINESS_INSIDER,
    "reuters": Id.REUTERS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
