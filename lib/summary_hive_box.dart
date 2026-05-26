import 'package:hive_flutter/hive_flutter.dart';

const String articleHiveBox = 'articleHiveBox';

class ArticleHiveBox {
  static final summaryBox = Hive.box(articleHiveBox);
  static void create(key, summary) {
    summaryBox.put(key, summary);
  }

  static get(key) {
    return summaryBox.get(key);
  }

  static List getAll() {
    return summaryBox.keys.map((key) => summaryBox.get(key)).toList();
  }
}

class Article {
  final String titles;
  final String? imageSource;
  final String? description;
  final int id;
  const Article({
    required this.id,
    required this.titles,
    this.description,
    this.imageSource,
  });
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final typeId = 1;
  @override
  Article read(BinaryReader reader) {
    return Article(
      titles: reader.read() as String,
      imageSource: reader.read() as String,
      description: reader.read() as String,
      id: reader.read() as int,
    );
  }
}
