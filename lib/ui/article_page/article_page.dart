import 'package:flutter/material.dart';
import 'package:wiki_reader/summary.dart';
import 'package:wiki_reader/ui/article_page/article_widget.dart';

class ArticlePage extends StatelessWidget {
  final Summary summary;
  final VoidCallback nextArticle;
  final VoidCallback saveToDB;
  const ArticlePage({
    super.key,
    required this.summary,
    required this.nextArticle,
    required this.saveToDB,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ArticleWidget(
            titles: summary.titles.normalized,
            imageSource: summary.originalImage?.source,
            description: summary.description,
            extract: summary.extract,
          ),
        ],
      ),
    );
  }
}
