import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wiki_reader/article_hive_box.dart';
import 'package:wiki_reader/ui/random_article/cubits/random_article.dart';
import 'package:wiki_reader/ui/article_page/article_page.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: .end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.favorite),
            onPressed: () {
              final state = context.read<ArticleCubit>().state;
              if (state is ArticleLoaded) {
                final s = state.summary;
                Article a = Article(
                  id: s.pageId,
                  titles: s.titles.normalized,
                  description: s.description,
                  imageSource: s.originalImage?.source,
                  extract: s.extract,
                );
                Hive.box<Article>(articleHiveBox).add(a);
              }
              ;
            },
          ),
          const SizedBox(width: 220),
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: context.read<ArticleCubit>().updateArticle,
          ),
        ],
      ),

      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          return switch (state) {
            ArticleLoading() => CircularProgressIndicator(),
            ArticleError(error: var e) => Text('Error $e'),
            ArticleLoaded(summary: var s) => ArticlePage(
              summary: s,
              nextArticle: context.read<ArticleCubit>().updateArticle,
              saveToDB: () {
                Article a = Article(
                  id: s.pageId,
                  titles: s.titles.normalized,
                  description: s.description,
                  imageSource: s.originalImage?.source,
                  extract: s.extract,
                );
                Hive.box<Article>(articleHiveBox).add(a);
              },
            ),
            ArticleInitial() => Text('initial'),
            _ => Text('Something is wrong'),
          };
        },
      ),
    );
  }
}
