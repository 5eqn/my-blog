import 'package:flutter/material.dart';
import 'package:minimal/components/components.dart';
import 'package:minimal/main.dart';
import 'package:provider/provider.dart';

class BlogData {
  final String title;
  final String description;
  final String url;

  BlogData({
    required this.title,
    required this.description,
    required this.url,
  });
}

final images = [
  "assets/images/paper_flower_overhead_bw_w1080.jpg",
  "assets/images/iphone_cactus_tea_overhead_bw_w1080.jpg",
  "assets/images/typewriter_overhead_bw_w1080.jpg",
  "assets/images/coffee_paperclips_pencil_angled_bw_w1080.jpg",
  "assets/images/joy_note_coffee_eyeglasses_overhead_bw_w1080.jpg"
];
final imageCount = images.length;

class ListPage extends StatelessWidget {
  static const String name = 'list';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(children: [
              const MinimalMenuBar(),
              Consumer<ArticleProvider>(
                builder: (context, provider, child) {
                  if (provider.articles.isEmpty) {
                    // If the list of articles is loading, show a loading indicator.
                    if (provider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Text("文章加载失败");
                    }
                  } else {
                    // If there are articles, display them in a ListView.
                    return Column(
                        children:
                            provider.articles.asMap().entries.map((entry) {
                      final article = entry.value;
                      final key = entry.key;
                      return Column(children: [
                        ListItem(
                          imageUrl: images[key % imageCount],
                          title: article.content[0].content,
                          description: trimString(article.content[1].content),
                          url: key.toString(),
                        ),
                        divider
                      ]);
                    }).toList());
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: const ListNavigation(),
              ),
              divider,
              const Footer(),
            ]),
          )),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

String trimString(String str) {
  if (str.length > 100) {
    return '${str.substring(0, 100)}...';
  } else {
    return str;
  }
}
