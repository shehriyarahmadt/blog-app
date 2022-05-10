import 'dart:convert';

Dictionary dictionaryFromMap(String str) => Dictionary.fromMap(json.decode(str));

String dictionaryToMap(Dictionary data) => json.encode(data.toMap());

class Dictionary {
  Dictionary({
    required this.definitions,
    required this.word,
    required this.pronunciation,
  });

  final List<Definition>? definitions;
  final String? word;
  final String? pronunciation;

  factory Dictionary.fromMap(Map<String, dynamic> json) => Dictionary(
    definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromMap(x))),
    word: json["word"],
    pronunciation: json["pronunciation"],
  );

  Map<String, dynamic> toMap() => {
    "definitions": List<dynamic>.from(definitions!.map((x) => x.toMap())),
    "word": word,
    "pronunciation": pronunciation,
  };
}

class Definition {
  Definition({
   required this.type,
   required this.definition,
   required this.example,
   required this.imageUrl,
   required this.emoji,
  });

  final String? type;
  final String? definition;
  final String? example;
  final String? imageUrl;
  final String? emoji;

  factory Definition.fromMap(Map<String, dynamic> json) => Definition(
    type: json["type"],
    definition: json["definition"],
    example: json["example"],
    imageUrl: json["image_url"],
    emoji: json["emoji"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "definition": definition,
    "example": example,
    "image_url": imageUrl,
    "emoji": emoji,
  };
}
