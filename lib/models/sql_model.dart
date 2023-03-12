List<String> listOfTableNames = List.generate(
  30,
  (index) => "table${index + 1}",
);

class SqlModels {
  int? id;
  String? title;
  String? price;
  String? description;

  SqlModels({
    this.id,
    this.price,
    this.title,
    this.description,
  });

  static SqlModels fromJson(Map<String, dynamic> json) {
    return SqlModels(
      id: json[SqlField.id],
      price: json[SqlField.price],
      title: json[SqlField.title],
      description: json[SqlField.description],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      SqlField.id: id,
      SqlField.title: title,
      SqlField.price: price,
      SqlField.description: description,
    };
  }

  SqlModels copy({
    int? id,
    String? title,
    String? price,
    String? description,
  }) {
    return SqlModels(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}

class SqlField {
  static const String id = "_id";
  static const String title = "_title";
  static const String price = "_price";
  static const String description = "_description";

  static List<String> values = [
    id,
    price,
    title,
    SqlField.description,
  ];
}
