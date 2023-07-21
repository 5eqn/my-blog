class Article {
  final int id;
  final DateTime createdAt;
  final String name;
  final List<Paragraph> content;

  Article({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        name: json["Name"],
        content: List<Paragraph>.from(
            json["Content"].map((x) => Paragraph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "Name": name,
        "Content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Paragraph {
  final int id;
  final int articleID;
  final ParaType type;
  final String content;
  final String metadata;

  Paragraph({
    required this.id,
    required this.articleID,
    required this.type,
    required this.content,
    required this.metadata,
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
        id: json["ID"],
        articleID: json["ArticleID"],
        type: paraTypeValues.map[json["Type"]]!,
        content: json["Content"],
        metadata: json["Metadata"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "ArticleID": articleID,
        "Type": paraTypeValues.reverse[type]!,
        "Content": content,
        "Metadata": metadata,
      };
}

enum ParaType {
  primaryHeader,
  secondaryHeader,
  text,
  code,
}

final paraTypeValues = EnumValues({
  "PRIMARY_HEADER": ParaType.primaryHeader,
  "SECONDARY_HEADER": ParaType.secondaryHeader,
  "TEXT": ParaType.text,
  "CODE": ParaType.code,
});

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map) {
    reverseMap = map.map(
      (key, value) => MapEntry(value, key),
    );
  }

  Map<T, String> get reverse {
    return reverseMap;
  }
}
