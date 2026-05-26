import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String titles;
  final String? imageSource;
  final String? description;
  final String extract;
  const ArticleWidget({
    super.key,
    required this.titles,
    this.imageSource,
    this.description,
    required this.extract,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        spacing: 10,
        children: [
          if (imageSource != null) Image.network(imageSource!),
          Text(
            titles,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          if (description != null)
            Text(
              description!,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          Text(extract),
        ],
      ),
    );
  }
}
